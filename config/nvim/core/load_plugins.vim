lua << EOF
local package_manager = g.etc_package_manager or 'plug'
local vim_path = g.etc_vim_path or VIM_PATH
local cache_path = CACHE_PATH .. '/vim'
local config_path = vim_path .. '/core/plugins.yaml'
local yaml2json_method = 'python'

local function is_empty(s)
  return s == nil or s == ''
end

local function get_cmd()
  if is_empty(yaml2json_method) then
    yaml2json_method = 'python'
  end

  if yaml2json_method == 'ruby' then
    cmd = [[ ruby -e 'require "json"; require "yaml"; print JSON.generate YAML.load $stdin.read'; ]]
  elseif yaml2json_method == 'python' then
    cmd = [[ python -c 'import sys,yaml,json; y=yaml.safe_load(sys.stdin.read()); print(json.dumps(y))' ]]
  elseif yaml2json_method == 'yq' then
    cmd = 'yq .'
  else
    cmd = yaml2json_method
  end

  return cmd
end

local function load_config(path)
  -- Parse YAML with common command-line utilities
  local cmd = ''
  local output = ''

  cmd = get_cmd()

  local f = io.popen(string.format('cat %s | %s', path, cmd))
  local output = f:read('*a')
  f.close()

  return vim.call('json_decode', output)
end

local function my_error(msg)
  cmd('echohl WarningMsg')
  cmd('echomsg "' .. message .. '"')
  cmd('echohl None')
end

local function use_plug()
  -- vim-plug package-manager initialization
  local cache_root = DATA_PATH .. '/plug'
  local cache_init = cache_root .. '/init.vimplug'
  local cache_repos = cache_root .. '/repos'

  -- check if plug is already configured and/or installed
  local rtp = api.nvim_exec('set runtimepath?', true)
  if not string.find(rtp, '/init.vimplug') then
    if not is_dir(cache_init) then
      install_plug()
    end
    -- add plug to runtimepath
    cmd(string.format('set runtimepath+=%s', vim.call('fnamemodify', cache_init, ':p')))
  end

  local rc = load_config(config_path)
  if is_empty(rc) then
    my_error('Empty plugin list')
    return
  end

  -- Do the thing
  for _, plugin in ipairs(rc) do
    if plugin['hook_pre_source'] ~= nil then
      api.nvim_exec(plugin['hook_pre_source'], false)
    end
  end

  -- vim.call(string.format("plug#begin('%s')", cache_repos))
  vim.fn['plug#begin'](cache_repos)
  for _, plugin in ipairs(rc) do
    -- vim.call(string.format('plug#("%s", extend(plugin, {}, "keep")', plugin['repo']))
    vim.fn['plug#'](plugin['repo'])
    if plugin['hook_source'] ~= nil then
      api.nvim_exec(plugin['hook_source'], false)
    end
  end
  -- vim.call('plug#end()')
  vim.fn['plug#end']()

  for _, plugin in ipairs(rc) do
    if plugin['hook_post_source'] ~= nil then
      api.nvim_exec(plugin['hook_post_source'], false)
    end
  end
end

local function start_plugin_manager(manager)
  local plugin_managers = {
    plug = use_plug
  }

  if plugin_managers[manager] ~= nil then
    plugin_managers[manager]()
  end
end

local function install_plug()
  os.execute([[
    curl -fLo $DATA_PATH/plug/init.vimplug/autoload/plug.vim \
    --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ]])

  -- prep augroup
  api.nvim_exec([[
    augroup user_plugin_vimplug
      autocmd!
    augroup END
  ]])
  -- set PlugInstall to run on VimEnter
  api.nvim_exec('autocmd user_plugin_vimplug VimEnter * PlugInstall --sync | source $MYVIMRC')
end

start_plugin_manager(package_manager)
EOF

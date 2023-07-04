-- Defaults: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
opt.foldenable = false
opt.foldlevelstart = 99
opt.foldtext = "v:lua.custom_fold_text()"
opt.wildmode = "list:longest,list:full"
opt.whichwrap:append("<,>,h,l")
opt.wrap = false
opt.listchars:append({
  nbsp = "␠",
  extends = "→",
  precedes = "←",
  tab = "├─",
  trail = "·",
})
opt.scrolloff = 2
opt.sidescrolloff = 10

-- Secure sensitive information, disable backup files in temp directories
opt.secure = true
if fn.exists("&backupskip") ~= 0 then
  opt.backupskip:append({
    "/tmp/*",
    "$TMPDIR/*",
    "$TMP/*",
    "$TEMP/*",
    "*/shm/*",
    "/private/var/*",
    "*.nobackup/*",
    "*.noindex/*",
  })
end

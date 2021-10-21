local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings {
    ui = {
        icons = {
            -- The list icon to use for installed servers.
            -- server_installed = "◍",
            server_installed = "✓",
            -- The list icon to use for servers that are pending installation.
            -- server_pending = "◍",
            server_pending = "➜",
            -- The list icon to use for servers that are not installed.
            -- server_uninstalled = "◍",
            server_uninstalled = "✗"

        },
        keymaps = {
            -- Keymap to expand a server in the UI
            toggle_server_expand = "<CR>",
            -- Keymap to install a server
            install_server = "i",
            -- Keymap to reinstall/update a server
            update_server = "u",
            -- Keymap to uninstall a server
            uninstall_server = "X",
        },
    },

    -- The directory in which to install all servers.
    install_root_dir = fn.stdpath('data')..'/data/lsp_servers',

    pip = {
        -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
        -- and is not recommended.
        --
        -- Example: { "--proxy", "https://proxyserver" }
        install_args = {},
    },

    -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
    -- debugging issues with server installations.
    log_level = vim.log.levels.INFO,

    -- Whether to allow LSP servers to share the same installation directory. For some servers, this effectively causes
    -- more than one server to be installed (and uninstalled) when executing `:LspInstall` and `:LspUninstall`. For
    -- example, installing `cssls` will also install both `jsonls` and `html` (and the other ways around), as these all
    -- share the same underlying package.
    allow_federated_servers = true,

    -- Limit for the maximum amount of servers to be installed at the same time. Once this limit is reached, any further
    -- servers that are requested to be installed will be put in a queue.
    max_concurrent_installers = 4,
}

lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

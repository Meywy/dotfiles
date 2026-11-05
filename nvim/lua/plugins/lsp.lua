
return {
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'hrsh7th/cmp-nvim-lsp' },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            
            -- 1. Apply global fallback capabilities to ALL configurations
            vim.lsp.config('*', { capabilities = capabilities })

            -- 2. Configure specialized setups
            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                            path = { 'lua/?.lua', 'lua/?/init.lua' },
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = { vim.env.VIMRUNTIME },
                        },
                    },
                },
            })

            vim.lsp.config('nixd', {
                settings = {
                    nixd = {
                        nixpkgs = {
                            expr = 'import <nixpkgs> {}',
                        },
                        options = {
                            nixos = {
                                expr = '(builtins.getFlake "/home/vojta/Config").nixosConfigurations."nixos".options',
                            },
                        },
                    },
                },
            })

            -- 3. EDIT THIS LOOP: Only enable plain strings for standard servers.
            -- (Removed 'lua_ls' and 'nixd' from this array since we configured them above)
            local standard_servers = { 'ts_ls', 'rust_analyzer', 'clangd', 'denols', 'gopls' }
            for _, lsp in ipairs(standard_servers) do
                vim.lsp.enable(lsp)
            end

            -- 4. ADD THESE TWO LINES: Explicitly enable your custom-built configurations
            vim.lsp.enable('lua_ls')
            vim.lsp.enable('nixd')
        end,
    },
}

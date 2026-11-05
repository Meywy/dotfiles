return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
        },
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<C-v>'] = cmp.mapping.complete(), -- Your preferred trigger
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter to accept
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim-lsp' },
                    { name = 'buffer' },
                    { name = 'path' },
                })
            })
        end
    }
}


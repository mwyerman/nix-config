return {
	"mhartington/formatter.nvim",
	config = function()
		local ft = require("formatter.filetypes")
		local opts = {
			filetype = {
				nix = { ft.nix.nixfmt },
				rust = { ft.rust.rustfmt },
				c = { ft.c.clang_format },
				lua = { ft.lua.stylua },
				python = { ft.python.isort, ft.python.black },
				json = { ft.json.prettier },
				markdown = { ft.markdown.prettier },
				yaml = { ft.yaml.prettier },
				javascript = { ft.javascript.prettier },
				typescript = { ft.typescript.prettier },
				css = { ft.css.prettier },
				html = { ft.html.prettier },
			},
		}

		require("formatter").setup(opts)

		vim.api.nvim_create_autocmd({
			"BufWritePost",
		}, {
			command = "FormatWrite",
		})
	end,
}

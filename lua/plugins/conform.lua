local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		javascript = { "oxfmt" },
		typescript = { "oxfmt" },
		javascriptreact = { "oxfmt" },
		typescriptreact = { "oxfmt" },
		css = { "oxfmt" },
		html = { "oxfmt" },
		json = { "oxfmt" },
		yaml = { "oxfmt" },
		markdown = { "oxfmt" },
		graphql = { "oxfmt" },
		lua = { "stylua" },
		python = { "isort", "black" },
		go = { "gofmt", "goimports" },
		rust = { "rustfmt" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		zsh = { "shfmt" },
		toml = { "taplo" },
		["*"] = { "trim_whitespace" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	formatters = {
		shfmt = {
			prepend_args = { "-i", "2" },
		},
	},
})

vim.keymap.set({ "n", "v" }, "<leader>lf", function()
	conform.format({
		lsp_format = "fallback",
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file or range (in visual mode)" })

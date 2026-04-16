local fzf = require("fzf-lua")

fzf.setup({
	winopts = {
		height = 0.85,
		width = 0.80,
		row = 0.35,
		col = 0.50,
		border = "rounded",
		preview = {
			border = "border",
			wrap = "nowrap",
			hidden = "nohidden",
			vertical = "down:45%",
			horizontal = "right:50%",
			layout = "flex",
			flip_columns = 120,
			title = true,
			scrollbar = "float",
			delay = 100,
		},
	},
	fzf_opts = {
		["--layout"] = "reverse",
		["--info"] = "inline",
		["--bind"] = "ctrl-j:down,ctrl-k:up",
	},
})

local map = vim.keymap.set

-- Files
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find Files" })
map("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", { desc = "Recent Files" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fc", function()
	fzf.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config File" })
map("n", "<leader>fg", "<cmd>FzfLua git_files<cr>", { desc = "Find Git Files" })

-- Grep
map("n", "<leader>ft", "<cmd>FzfLua live_grep<cr>", { desc = "Live Grep" })
map("n", "<leader>fw", "<cmd>FzfLua grep_cword<cr>", { desc = "Grep Word Under Cursor" })
map("v", "<leader>fw", "<cmd>FzfLua grep_visual<cr>", { desc = "Grep Visual Selection" })
map("n", "<leader>fl", "<cmd>FzfLua blines<cr>", { desc = "Buffer Lines" })
map("n", "<leader>fL", "<cmd>FzfLua lines<cr>", { desc = "Lines (All Buffers)" })

-- Git
map("n", "<leader>gs", "<cmd>FzfLua git_status<cr>", { desc = "Git Status" })
map("n", "<leader>gb", "<cmd>FzfLua git_branches<cr>", { desc = "Git Branches" })
map("n", "<leader>gl", "<cmd>FzfLua git_commits<cr>", { desc = "Git Log" })
map("n", "<leader>gf", "<cmd>FzfLua git_bcommits<cr>", { desc = "Git Log File" })
map("n", "<leader>gS", "<cmd>FzfLua git_stash<cr>", { desc = "Git Stash" })

-- Search
map("n", "<leader>fh", "<cmd>FzfLua help_tags<cr>", { desc = "Help Pages" })
map("n", "<leader>fk", "<cmd>FzfLua keymaps<cr>", { desc = "Keymaps" })
map("n", "<leader>fH", "<cmd>FzfLua highlights<cr>", { desc = "Highlights" })
map("n", "<leader>fR", "<cmd>FzfLua resume<cr>", { desc = "Resume" })
map("n", '<leader>f"', "<cmd>FzfLua registers<cr>", { desc = "Registers" })
map("n", "<leader>fa", "<cmd>FzfLua autocmds<cr>", { desc = "Autocmds" })
map("n", "<leader>f/", "<cmd>FzfLua search_history<cr>", { desc = "Search History" })
map("n", "<leader>:", "<cmd>FzfLua command_history<cr>", { desc = "Command History" })
map("n", "<leader>fM", "<cmd>FzfLua man_pages<cr>", { desc = "Man Pages" })
map("n", "<leader>fq", "<cmd>FzfLua quickfix<cr>", { desc = "Quickfix List" })
map("n", "<leader>fj", "<cmd>FzfLua jumps<cr>", { desc = "Jumps" })
map("n", "<leader>uC", "<cmd>FzfLua colorschemes<cr>", { desc = "Colorschemes" })

-- Diagnostics
map("n", "<leader>fd", "<cmd>FzfLua diagnostics_document<cr>", { desc = "Buffer Diagnostics" })
map("n", "<leader>fD", "<cmd>FzfLua diagnostics_workspace<cr>", { desc = "Workspace Diagnostics" })

-- Buffer
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })

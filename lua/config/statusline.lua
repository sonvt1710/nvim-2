local M = {}

local NONE = "NONE"

-- Default colorscheme palette (Neovim 0.12)
local palette = {
	bg = "#14161b",
	bg_float = "#07080d",
	bg_cursor = "#2c2e33",
	bg_status = "#4f5258",
	fg = "#e0e2ea",
	comment = "#9b9ea4",
	green = "#b3f6c0",
	cyan = "#8cf8f7",
	blue = "#a6dbff",
	red = "#ffc0b9",
	yellow = "#fce094",
	dark_green = "#005523",
	dark_blue = "#1e2630",
	dark_red = "#3b1a1a",
	dark_purple = "#2e2440",
	dark_cyan = "#1a3040",
}

local function hi(group, opts)
	local cmd = { "highlight!", group }
	if opts.guibg then
		table.insert(cmd, "guibg=" .. opts.guibg)
	end
	if opts.guifg then
		table.insert(cmd, "guifg=" .. opts.guifg)
	end
	if opts.gui then
		table.insert(cmd, "gui=" .. opts.gui)
	end
	vim.cmd(table.concat(cmd, " "))
end

local stl_bg = palette.bg_cursor
local stl_fg = palette.fg

hi("StatusLine", { guibg = stl_bg, guifg = stl_fg })
hi("StatusLineNC", { guibg = stl_bg, guifg = palette.comment })

-- Per-mode highlights (color as background, editor bg as fg for contrast)
local function editor_bg()
	local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
	if normal.bg then
		return string.format("#%06x", normal.bg)
	end
	return palette.bg -- fallback if Normal has transparent bg
end

local mode_fg = editor_bg()
vim.api.nvim_set_hl(0, "NormalMode", { fg = mode_fg, bg = "#388bfd", bold = true })
vim.api.nvim_set_hl(0, "InsertMode", { fg = mode_fg, bg = "#56d364", bold = true })
vim.api.nvim_set_hl(0, "VisualMode", { fg = mode_fg, bg = "#a371f7", bold = true })
vim.api.nvim_set_hl(0, "CommandMode", { fg = mode_fg, bg = "#f2cc60", bold = true })
vim.api.nvim_set_hl(0, "ReplaceMode", { fg = mode_fg, bg = "#f85149", bold = true })
vim.api.nvim_set_hl(0, "SelectMode", { fg = mode_fg, bg = "#db6d28", bold = true })

local mode_hl_map = {
	n = "NormalMode",
	i = "InsertMode",
	v = "VisualMode",
	V = "VisualMode",
	["\22"] = "VisualMode", -- Ctrl-V (visual block)
	s = "SelectMode",
	S = "SelectMode",
	["\19"] = "SelectMode", -- Ctrl-S (select block)
	R = "ReplaceMode",
	c = "CommandMode",
	r = "CommandMode",
	["!"] = "CommandMode",
	t = "InsertMode", -- terminal
}

-- git
hi("StatusGit", { guibg = stl_bg, guifg = stl_fg, gui = "bold" })
hi("StatusGitToNorm", { guibg = stl_bg, guifg = stl_fg })
hi("StatusDiffAdd", { guibg = stl_bg, guifg = palette.green, gui = "bold" })
hi("StatusDiffChange", { guibg = stl_bg, guifg = palette.yellow, gui = "bold" })
hi("StatusDiffDelete", { guibg = stl_bg, guifg = palette.red, gui = "bold" })

hi("StatusLSP", { guibg = stl_bg, guifg = stl_fg, gui = "bold" })
hi("StatusLSPToNorm", { guibg = stl_bg, guifg = stl_fg })

hi("StatusErrorIcon", { guibg = stl_bg, guifg = palette.red, gui = "bold" })
hi("StatusWarnIcon", { guibg = stl_bg, guifg = palette.yellow, gui = "bold" })
hi("StatusInfoIcon", { guibg = stl_bg, guifg = palette.cyan, gui = "bold" })
hi("StatusHintIcon", { guibg = stl_bg, guifg = palette.blue })

hi("StatusBuffer", { guibg = stl_bg, guifg = stl_fg })
hi("StatusType", { guibg = stl_bg, guifg = stl_fg })
hi("StatusNorm", { guibg = stl_bg, guifg = stl_fg })
hi("StatusLocation", { guibg = stl_bg, guifg = stl_fg })
hi("StatusPercent", { guibg = stl_bg, guifg = stl_fg })

local fn = vim.fn

local _diag_cache = {}

vim.api.nvim_create_autocmd("DiagnosticChanged", {
	callback = function(args)
		local buf = args.buf
		local sev = vim.diagnostic.severity
		local counts = vim.diagnostic.count(buf)
		_diag_cache[buf] = {
			e = counts[sev.ERROR] or 0,
			w = counts[sev.WARN] or 0,
			i = counts[sev.INFO] or 0,
			h = counts[sev.HINT] or 0,
		}
	end,
})

local _wc_state = { words = 0, timer = nil }

vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "BufEnter" }, {
	callback = function()
		local ft = vim.bo.filetype
		if not (ft:match("md") or ft:match("markdown") or ft == "text") then
			return
		end
		if _wc_state.timer then
			_wc_state.timer:stop()
			_wc_state.timer:close()
		end
		_wc_state.timer = vim.defer_fn(function()
			_wc_state.timer = nil
			_wc_state.words = fn.wordcount().words or 0
		end, 500)
	end,
})

local _icon_cache = {}

vim.api.nvim_create_autocmd({ "BufWipeout", "BufDelete" }, {
	callback = function(args)
		_icon_cache[args.buf] = nil
	end,
})

local function get_git_branch()
	local branch = vim.b.gitsigns_head
	if not branch or branch == "" then
		return ""
	end

	local gs = vim.b.gitsigns_status_dict
	if gs and gs.root then
		local repo_name = vim.fn.fnamemodify(gs.root, ":t")
		return repo_name .. "/" .. branch
	end

	return branch
end

local function build_git_diff()
	local gs = vim.b.gitsigns_status_dict or {}
	local added = gs.added or 0
	local changed = gs.changed or 0
	local removed = gs.removed or 0

	local diff_str = ""
	if added > 0 then
		diff_str = diff_str .. "%#StatusDiffAdd# " .. added .. " "
	end
	if changed > 0 then
		diff_str = diff_str .. "%#StatusDiffChange# " .. changed .. " "
	end
	if removed > 0 then
		diff_str = diff_str .. "%#StatusDiffDelete# " .. removed .. " "
	end

	return diff_str .. "%#StatusLine#"
end

local function get_diagnostics()
	local buf = vim.api.nvim_get_current_buf()
	local c = _diag_cache[buf] or {}
	local s = ""
	if (c.e or 0) > 0 then
		s = s .. "%#StatusErrorIcon# " .. c.e .. " "
	end
	if (c.w or 0) > 0 then
		s = s .. "%#StatusWarnIcon# " .. c.w .. " "
	end
	if (c.i or 0) > 0 then
		s = s .. "%#StatusInfoIcon# " .. c.i .. " "
	end
	if (c.h or 0) > 0 then
		s = s .. "%#StatusHintIcon# " .. c.h .. " "
	end

	return s .. "%#StatusLine#"
end

local function get_file_icon()
	local bufnr = vim.api.nvim_get_current_buf()
	if _icon_cache[bufnr] ~= nil then
		return _icon_cache[bufnr]
	end

	local ok, icons = pcall(require, "nvim-web-devicons")
	if not ok then
		_icon_cache[bufnr] = ""
		return ""
	end
	local name = vim.api.nvim_buf_get_name(bufnr)
	local f = fn.fnamemodify(name, ":t")
	local e = fn.fnamemodify(name, ":e")
	local icon = icons.get_icon(f, e, { default = true })
	local result = icon and icon .. " " or ""
	_icon_cache[bufnr] = result
	return result
end

local function word_reading()
	local ft = vim.bo.filetype
	if ft:match("md") or ft:match("markdown") or ft == "text" then
		local w = _wc_state.words
		if w == 0 then
			return ""
		end
		return w .. "w " .. " " .. math.ceil(w / 200) .. "m"
	end
	return ""
end

-- Mode icons use Unicode escapes to survive file writes
local mode_icons = {
	n = " NORMAL",
	c = " COMMAND",
	t = " TERMINAL",
	i = " INSERT",
	R = " REPLACE",
	V = " V-LINE",
	["\22"] = " V-BLOCK",
	r = " R-PENDING",
	v = " VISUAL",
}

function M.build()
	local st = ""

	-- A: mode
	local m = fn.mode()
	local mode_group = mode_hl_map[m] or "NormalMode"
	st = st .. "%#" .. mode_group .. "# " .. (mode_icons[m] or m) .. " %#StatusLine#"

	-- B: git
	local br = get_git_branch()
	if br ~= "" then
		st = st .. "%#StatusGit# " .. " " .. br .. " " .. "%#StatusGitToNorm#"

		local git_diff = build_git_diff()
		if git_diff ~= "" then
			st = st .. git_diff .. "%#StatusGitToNorm#"
		end
	end

	local di = get_diagnostics()
	if di ~= "" then
		st = st .. "%#StatusLSP# " .. di .. " " .. "%#StatusLSPToNorm#"
	end

	-- right align
	st = st .. "%="

	-- LSP progress
	local progress = vim.ui.progress_status and vim.ui.progress_status() or ""
	if progress ~= "" then
		st = st .. "%#StatusLSP# " .. progress .. " %#StatusLine#"
	end

	-- X: filetype
	local ft = vim.bo.filetype
	if ft ~= "" then
		st = st .. "%#StatusType# " .. get_file_icon() .. ft .. "%#StatusTypeToNorm#"
	end

	-- Y: word/reading
	local wr = word_reading()
	if wr ~= "" then
		st = st .. "%#StatusBuffer# " .. " " .. wr
	end

	-- Z: encoding, format, percent
	st = st .. "%#StatusBuffer# " .. vim.bo.fileencoding .. " " .. vim.bo.fileformat .. " " .. "%#StatusPercent# %p%% "

	return st
end

vim.opt.laststatus = 3
vim.opt.showmode = false
vim.o.statusline = "%!v:lua.require('config.statusline').build()"

return M

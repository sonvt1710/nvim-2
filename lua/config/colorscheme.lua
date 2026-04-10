vim.cmd.colorscheme("default")

local hl = vim.api.nvim_set_hl

-- WinBar
hl(0, "WinBar", { fg = "#9b9ea4", bg = "NONE", bold = true })
hl(0, "WinBarNC", { fg = "#9b9ea4", bg = "NONE" })

-- Blink completion menu (match editor background)
hl(0, "BlinkCmpMenu", { bg = "#14161b", fg = "#e0e2ea" })
hl(0, "BlinkCmpMenuBorder", { bg = "#14161b", fg = "#4f5258" })
hl(0, "BlinkCmpMenuSelection", { bg = "#2c2e33", fg = "#e0e2ea" })
hl(0, "BlinkCmpLabel", { bg = "NONE", fg = "#e0e2ea" })
hl(0, "BlinkCmpLabelMatch", { bg = "NONE", fg = "#8cf8f7", bold = true })
hl(0, "BlinkCmpLabelDetail", { bg = "NONE", fg = "#9b9ea4" })
hl(0, "BlinkCmpLabelDescription", { bg = "NONE", fg = "#9b9ea4" })
hl(0, "BlinkCmpLabelDeprecated", { bg = "NONE", fg = "#9b9ea4", strikethrough = true })
hl(0, "BlinkCmpKind", { bg = "NONE", fg = "#e0e2ea" })
hl(0, "BlinkCmpDoc", { bg = "#14161b", fg = "#e0e2ea" })
hl(0, "BlinkCmpDocBorder", { bg = "#14161b", fg = "#4f5258" })
hl(0, "BlinkCmpDocSeparator", { bg = "#14161b", fg = "#4f5258" })
hl(0, "BlinkCmpScrollBarThumb", { bg = "#4f5258" })
hl(0, "BlinkCmpScrollBarGutter", { bg = "#14161b" })

-- Snacks indent guides
hl(0, "SnacksIndent", { fg = "#2c2e33" })
hl(0, "SnacksIndentScope", { fg = "#4f5258" })

-- Window splits
hl(0, "WinSeparator", { fg = "#4f5258" })


vim.cmd.colorscheme("default")

local hl = vim.api.nvim_set_hl

local colors = {
	fg = "#e0e2ea",
	bg = "#14161b",
	alt_bg = "#27282d",

	light_grey_1 = "#eef1f8",
	light_grey_2 = "#e0e2ea",
	light_grey_3 = "#c4c6cd",
	light_grey_4 = "#9b9ea4",

	dark_grey_1 = "#07080d",
	dark_grey_2 = "#14161b",
	dark_grey_3 = "#2c2e33",
	dark_grey_4 = "#4f5258",

	cursorline = "#222428",
	reference = "#292b30",

	blue = "#a6dbff",
	red = "#ffc0b9",
	cyan = "#8cf8f7",
	green = "#b3f6c0",
	yellow = "#d7ba7d",
	purple = "#bb99f7",

	visual = "#214a73",
	select = "#03395e",
	match_bg = "#194765",
	match = "#29a9ff",

	hint = "#4bc1fe",
	info = "#FFCC66",
	warn = "#ff8800",
	error = "#F44747",
	other = "#7c3aed",
	hint_bg = "#232e34",
	info_bg = "#342f25",
	warn_bg = "#34291b",
	error_bg = "#332222",

	ui_red = "#ff6a6a",
	ui_blue = "#4bc1fe",
	ui_azure = "#7ccdfd",
	ui_cyan = "#00e2ce",
	ui_orange = "#f4891e",
	ui_yellow = "#fcdc00",
	ui_white = "#ffffff",
	ui_purple = "#bb99f7",
	ui_green = "#87ffaf",
}

-- Editor
hl(0, "Visual", { fg = "NONE", bg = colors.visual })
hl(0, "VisualNOS", { fg = "NONE", bg = colors.alt_bg })
hl(0, "CursorLine", { fg = "NONE", bg = colors.cursorline })

hl(0, "Comment", { fg = colors.light_grey_4, bg = "NONE", italic = true })
hl(0, "Variable", { fg = colors.fg, bg = "NONE" })
hl(0, "String", { fg = colors.green, bg = "NONE" })
hl(0, "Character", { fg = colors.green, bg = "NONE" })
hl(0, "Number", { fg = colors.purple, bg = "NONE" })
hl(0, "Float", { fg = colors.purple, bg = "NONE" })
hl(0, "Boolean", { fg = colors.purple, bg = "NONE" })
hl(0, "Constant", { fg = colors.fg, bg = "NONE" })
hl(0, "Type", { fg = colors.cyan, bg = "NONE" })
hl(0, "Function", { fg = colors.blue, bg = "NONE" })
hl(0, "Keyword", { fg = colors.light_grey_1, bg = "NONE" })
hl(0, "Conditional", { fg = colors.light_grey_1, bg = "NONE" })
hl(0, "Repeat", { fg = colors.light_grey_1, bg = "NONE" })
hl(0, "Operator", { fg = colors.fg, bg = "NONE" })
hl(0, "PreProc", { fg = colors.cyan, bg = "NONE" })
hl(0, "Include", { fg = colors.light_grey_1, bg = "NONE" })
hl(0, "Exception", { fg = colors.light_grey_1, bg = "NONE" })
hl(0, "StorageClass", { fg = colors.cyan, bg = "NONE" })
hl(0, "Structure", { fg = colors.cyan, bg = "NONE" })
hl(0, "Typedef", { fg = colors.cyan, bg = "NONE" })
hl(0, "Define", { fg = colors.light_grey_1, bg = "NONE" })
hl(0, "Macro", { fg = colors.light_grey_1, bg = "NONE" })
hl(0, "Debug", { fg = colors.red, bg = "NONE" })
hl(0, "Title", { fg = colors.light_grey_1, bg = "NONE", bold = true })
hl(0, "Label", { fg = colors.light_grey_1, bg = "NONE" })
hl(0, "SpecialChar", { fg = colors.light_grey_1, bg = "NONE" })
hl(0, "Delimiter", { fg = colors.fg, bg = "NONE" })
hl(0, "SpecialComment", { fg = colors.fg, bg = "NONE" })
hl(0, "Tag", { fg = colors.purple, bg = "NONE" })
hl(0, "Bold", { fg = colors.light_grey_1, bg = "NONE", bold = true })
hl(0, "Italic", { fg = "NONE", bg = "NONE", italic = true })
hl(0, "Underlined", { fg = "NONE", bg = "NONE", underline = true })
hl(0, "Ignore", { fg = "NONE", bg = "NONE", bold = true })
hl(0, "Todo", { fg = colors.red, bg = "NONE", bold = true })
hl(0, "Error", { fg = colors.error, bg = "NONE", bold = true })
hl(0, "Statement", { fg = colors.fg, bg = "NONE" })
hl(0, "Identifier", { fg = colors.fg, bg = "NONE" })
hl(0, "PreCondit", { fg = colors.fg, bg = "NONE" })
hl(0, "Special", { fg = colors.purple, bg = "NONE" })

-- Treesitter
hl(0, "@comment", { link = "Comment" })
hl(0, "@none", { fg = "NONE", bg = "NONE" })
hl(0, "@preproc", { link = "PreProc" })
hl(0, "@define", { link = "Define" })
hl(0, "@operator", { link = "Operator" })
hl(0, "@punctuation.delimeter", { link = "Delimiter" })
hl(0, "@punctuation.bracket", { link = "Delimiter" })
hl(0, "@punctuation.special", { fg = colors.red, bg = "NONE" })
hl(0, "@string", { link = "String" })
hl(0, "@string.regex", { link = "String" })
hl(0, "@string.escape", { link = "SpecialChar" })
hl(0, "@string.special", { link = "SpecialChar" })
hl(0, "@character", { link = "Character" })
hl(0, "@character.special", { link = "SpecialChar" })
hl(0, "@boolean", { link = "Boolean" })
hl(0, "@number", { link = "Number" })
hl(0, "@float", { link = "Float" })
hl(0, "@function", { link = "Function" })
hl(0, "@function.builtin", { link = "Function" })
hl(0, "@function.call", { link = "Function" })
hl(0, "@function.macro", { link = "Macro" })
hl(0, "@method", { link = "Function" })
hl(0, "@method.call", { link = "Function" })
hl(0, "@constructor", { link = "@type" })
hl(0, "@parameter", { fg = colors.fg, bg = "NONE" })
hl(0, "@keyword", { link = "Keyword" })
hl(0, "@keyword.function", { link = "Keyword" })
hl(0, "@keyword.operator", { link = "Keyword" })
hl(0, "@keyword.return", { fg = colors.yellow, bg = "NONE" })
hl(0, "@keyword.repeat", { link = "Include" })
hl(0, "@keyword.coroutine", { fg = colors.yellow, bg = "NONE" })
hl(0, "@keyword.conditional", { link = "Conditional" })
hl(0, "@conditional", { link = "Conditional" })
hl(0, "@repeat", { link = "Repeat" })
hl(0, "@debug", { link = "Debug" })
hl(0, "@label", { link = "Label" })
hl(0, "@include", { link = "Include" })
hl(0, "@exception", { link = "Exception" })
hl(0, "@type", { link = "Type" })
hl(0, "@type.builtin", { link = "Type" })
hl(0, "@type.definition", { link = "Typedef" })
hl(0, "@type.qualifier", { link = "Type" })
hl(0, "@storageclass", { link = "StorageClass" })
hl(0, "@attribute", { link = "PreProc" })
hl(0, "@field", { fg = colors.fg, bg = "NONE" })
hl(0, "@property", { fg = colors.fg, bg = "NONE" })
hl(0, "@variable", { link = "Variable" })
hl(0, "@variable.builtin", { fg = colors.fg, bg = "NONE" })
hl(0, "@constant", { link = "Constant" })
hl(0, "@constant.builtin", { fg = colors.fg, bg = "NONE" })
hl(0, "@constant.macro", { link = "Macro" })
hl(0, "@namespace", { link = "Type" })
hl(0, "@symbol", { link = "Identifier" })
hl(0, "@text", { link = "None" })
hl(0, "@text.strong", { link = "Bold" })
hl(0, "@text.emphasis", { link = "Italic" })
hl(0, "@text.underline", { link = "Underlined" })
hl(0, "@text.strike", { fg = "NONE", bg = "NONE", strikethrough = true })
hl(0, "@text.title", { link = "Title" })
hl(0, "@text.literal", { link = "String" })
hl(0, "@text.uri", { link = "Underlined" })
hl(0, "@text.math", { link = "Special" })
hl(0, "@text.environment", { link = "Macro" })
hl(0, "@text.environment.name", { link = "Type" })
hl(0, "@text.reference", { link = "Constant" })
hl(0, "@text.todo", { link = "Todo" })
hl(0, "@text.note", { link = "SpecialComment" })
hl(0, "@text.warning", { link = "Todo" })
hl(0, "@text.danger", { link = "WarningMsg" })
hl(0, "@tag", { link = "Tag" })
hl(0, "@tag.builtin.tsx", { link = "Tag" })
hl(0, "@tag.attribute", { fg = colors.fg, bg = "NONE", italic = true })
hl(0, "@tag.delimiter", { fg = colors.dark_grey_4, bg = "NONE" })
hl(0, "@lsp.type.comment", { link = "@comment" })
hl(0, "@lsp.type.enum", { link = "Type" })
hl(0, "@lsp.type.interface", { link = "Type" })
hl(0, "@lsp.type.keyword", { link = "Keyword" })
hl(0, "@lsp.type.namespace", { link = "@namespace" })
hl(0, "@lsp.type.parameter", { link = "@parameter" })
hl(0, "@lsp.type.property", { link = "@property" })
hl(0, "@lsp.type.variable", { link = "@variable" })
hl(0, "@lsp.typemod.method.defaultLibrary", { link = "@function.builtin" })
hl(0, "@lsp.typemod.function.defaultLibrary", { link = "@function.builtin" })
hl(0, "@lsp.typemod.variable.defaultLibrary", { link = "@variable.builtin" })
hl(0, "@lsp.typemod.operator.injected", { link = "@operator" })
hl(0, "@lsp.typemod.string.injected", { link = "@string" })
hl(0, "@lsp.typemod.variable.injected", { link = "@variable" })
hl(0, "LspCodeLens", { fg = colors.light_grey_4, bg = "NONE", italic = true })
hl(0, "LspCodeLensSeparator", { fg = colors.light_grey_4, bg = "NONE", italic = true })

-- LSP
hl(0, "LspInlayHint", { fg = colors.dark_grey_4, bg = "NONE" })
hl(0, "LspReferenceText", { bg = colors.reference })
hl(0, "LspReferenceRead", { bg = colors.reference })
hl(0, "LspReferenceWrite", { bg = colors.reference })
hl(0, "DiagnosticUnnecessary", { fg = "#6f7278", bg = "NONE", underdashed = true })
hl(0, "DiagnosticHint", { fg = colors.hint, bg = "NONE" })
hl(0, "DiagnosticInfo", { fg = colors.info, bg = "NONE" })
hl(0, "DiagnosticWarn", { fg = colors.warn, bg = "NONE" })
hl(0, "DiagnosticError", { fg = colors.error, bg = "NONE" })
hl(0, "DiagnosticOther", { fg = colors.other, bg = "NONE" })
hl(0, "DiagnosticSignHint", { link = "DiagnosticHint" })
hl(0, "DiagnosticSignInfo", { link = "DiagnosticInfo" })
hl(0, "DiagnosticSignWarn", { link = "DiagnosticWarn" })
hl(0, "DiagnosticSignError", { link = "DiagnosticError" })
hl(0, "DiagnosticSignOther", { link = "DiagnosticOther" })
hl(0, "DiagnosticSignWarning", { link = "DiagnosticWarn" })
hl(0, "DiagnosticFloatingHint", { link = "DiagnosticHint" })
hl(0, "DiagnosticFloatingInfo", { link = "DiagnosticInfo" })
hl(0, "DiagnosticFloatingWarn", { link = "DiagnosticWarn" })
hl(0, "DiagnosticFloatingError", { link = "DiagnosticError" })
hl(0, "DiagnosticUnderlineHint", { fg = "NONE", bg = "NONE", sp = colors.hint, undercurl = true })
hl(0, "DiagnosticUnderlineInfo", { fg = "NONE", bg = "NONE", sp = colors.info, undercurl = true })
hl(0, "DiagnosticUnderlineWarn", { fg = "NONE", bg = "NONE", sp = colors.warn, undercurl = true })
hl(0, "DiagnosticUnderlineError", { fg = "NONE", bg = "NONE", sp = colors.error, undercurl = true })
hl(0, "DiagnosticSignInformation", { link = "DiagnosticInfo" })
hl(0, "DiagnosticVirtualTextHint", { fg = colors.hint, bg = colors.hint_bg })
hl(0, "DiagnosticVirtualTextInfo", { fg = colors.info, bg = colors.info_bg })
hl(0, "DiagnosticVirtualTextWarn", { fg = colors.warn, bg = colors.warn_bg })
hl(0, "DiagnosticVirtualTextError", { fg = colors.error, bg = colors.error_bg })
hl(0, "LspDiagnosticsError", { fg = colors.error, bg = "NONE" })
hl(0, "LspDiagnosticsWarning", { fg = colors.warn, bg = "NONE" })
hl(0, "LspDiagnosticsInfo", { fg = colors.info, bg = "NONE" })
hl(0, "LspDiagnosticsInformation", { link = "LspDiagnosticsInfo" })
hl(0, "LspDiagnosticsHint", { fg = colors.hint, bg = "NONE" })
hl(0, "LspDiagnosticsDefaultError", { link = "LspDiagnosticsError" })
hl(0, "LspDiagnosticsDefaultWarning", { link = "LspDiagnosticsWarning" })
hl(0, "LspDiagnosticsDefaultInformation", { link = "LspDiagnosticsInfo" })
hl(0, "LspDiagnosticsDefaultInfo", { link = "LspDiagnosticsInfo" })
hl(0, "LspDiagnosticsDefaultHint", { link = "LspDiagnosticsHint" })
hl(0, "LspDiagnosticsVirtualTextError", { link = "DiagnosticVirtualTextError" })
hl(0, "LspDiagnosticsVirtualTextWarning", { link = "DiagnosticVirtualTextWarn" })
hl(0, "LspDiagnosticsVirtualTextInformation", { link = "DiagnosticVirtualTextInfo" })
hl(0, "LspDiagnosticsVirtualTextInfo", { link = "DiagnosticVirtualTextInfo" })
hl(0, "LspDiagnosticsVirtualTextHint", { link = "DiagnosticVirtualTextHint" })
hl(0, "LspDiagnosticsFloatingError", { link = "LspDiagnosticsError" })
hl(0, "LspDiagnosticsFloatingWarning", { link = "LspDiagnosticsWarning" })
hl(0, "LspDiagnosticsFloatingInformation", { link = "LspDiagnosticsInfo" })
hl(0, "LspDiagnosticsFloatingInfo", { link = "LspDiagnosticsInfo" })
hl(0, "LspDiagnosticsFloatingHint", { link = "LspDiagnosticsHint" })
hl(0, "LspDiagnosticsSignError", { link = "LspDiagnosticsError" })
hl(0, "LspDiagnosticsSignWarning", { link = "LspDiagnosticsWarning" })
hl(0, "LspDiagnosticsSignInformation", { link = "LspDiagnosticsInfo" })
hl(0, "LspDiagnosticsSignInfo", { link = "LspDiagnosticsInfo" })
hl(0, "LspDiagnosticsSignHint", { link = "LspDiagnosticsHint" })
hl(0, "NvimTreeLspDiagnosticsError", { link = "LspDiagnosticsError" })
hl(0, "NvimTreeLspDiagnosticsWarning", { link = "LspDiagnosticsWarning" })
hl(0, "NvimTreeLspDiagnosticsInformation", { link = "LspDiagnosticsInfo" })
hl(0, "NvimTreeLspDiagnosticsInfo", { link = "LspDiagnosticsInfo" })
hl(0, "NvimTreeLspDiagnosticsHint", { link = "LspDiagnosticsHint" })
hl(0, "LspDiagnosticsUnderlineError", { link = "DiagnosticUnderlineError" })
hl(0, "LspDiagnosticsUnderlineWarning", { link = "DiagnosticUnderlineWarn" })
hl(0, "LspDiagnosticsUnderlineInformation", { link = "DiagnosticUnderlineInfo" })
hl(0, "LspDiagnosticsUnderlineInfo", { link = "DiagnosticUnderlineInfo" })
hl(0, "LspDiagnosticsUnderlineHint", { link = "DiagnosticUnderlineHint" })

-- QuickFix
hl(0, "QuickFixLine", { link = "PmenuSel" })
hl(0, "qfSeparator", { fg = colors.fg, bg = "NONE" })
hl(0, "qfFilename", { fg = colors.cyan, bg = "NONE" })
hl(0, "qfLineNr", { fg = colors.ui_orange, bg = "NONE" })
hl(0, "qfError", { link = "Error" })

-- Bqf
hl(0, "BqfPreviewBorder", { link = "FloatBorder" })
hl(0, "BqfPreviewRange", { link = "Visual" })
hl(0, "BqfSign", { fg = colors.yellow, bg = "NONE" })

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

-- Eyeliner
hl(0, "EyelinerPrimary", { fg = "#ff00ff", bg = "NONE", bold = true })
hl(0, "EyelinerSecondary", { fg = "#00ffff", bg = "NONE", bold = true })

-- Snacks indent guides
hl(0, "SnacksIndent", { fg = "#2c2e33" })
hl(0, "SnacksIndentScope", { fg = "#4f5258" })

-- Window splits
hl(0, "WinSeparator", { fg = "#4f5258" })

-- Rainbow
hl(0, "TSRainbowRed", { fg = "#f85149", bg = "NONE" })
hl(0, "TSRainbowYellow", { fg = "#ffd602", bg = "NONE" })
hl(0, "TSRainbowBlue", { fg = "#169fff", bg = "NONE" })
hl(0, "TSRainbowOrange", { fg = "#db6d28", bg = "NONE" })
hl(0, "TSRainbowGreen", { fg = "#56d364", bg = "NONE" })
hl(0, "TSRainbowViolet", { fg = "#da70d6", bg = "NONE" })
hl(0, "TSRainbowCoral", { fg = "#ea6045", bg = "NONE" })
hl(0, "TSRainbowPink", { fg = "#f778ba", bg = "NONE" })

hl(0, "NormalMode", { fg = "#388bfd", bg = "NONE" })
hl(0, "InsertMode", { fg = "#56d364", bg = "NONE" })
hl(0, "VisualMode", { fg = "#a371f7", bg = "NONE" })
hl(0, "CommandMode", { fg = "#f2cc60", bg = "NONE" })
hl(0, "ReplaceMode", { fg = "#f85149", bg = "NONE" })
hl(0, "SelectMode", { fg = "#db6d28", bg = "NONE" })

hl(0, "SnacksPickerListCursorLine", { bg = colors.visual })
hl(0, "SnacksPickerDir", { fg = colors.light_grey_4, bg = "NONE" })

-- vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { link = "Visual" })

-- Lua
hl(0, "@lsp.type.property.lua", { fg = colors.fg, bg = "NONE" })
hl(0, "@lsp.typemod.variable.global.lua", { fg = colors.cyan, bg = "NONE" })
hl(0, "@lsp.typemod.variable.defaultLibrary.lua", { fg = colors.cyan, bg = "NONE" })
hl(0, "@lsp.mod.global.lua", { fg = colors.cyan, bg = "NONE" })
hl(0, "@constant.builtin.lua", { fg = colors.cyan, bg = "NONE" })
hl(0, "@field.lua", { fg = colors.fg, bg = "NONE" })
hl(0, "@constructor.lua", { fg = colors.fg, bg = "NONE" })
hl(0, "@variable.lua", { fg = colors.fg, bg = "NONE" })
hl(0, "@lsp.type.variable.lua", { fg = colors.fg, bg = "NONE" })
hl(0, "@lsp.type.property.lua", { fg = colors.fg, bg = "NONE" })
hl(0, "@lsp.typemod.function.global.lua", { link = "Function" })
hl(0, "@lsp.typemod.variable.declaration.lua", { link = "Variable" })

-- Typescript
hl(0, "@lsp.type.interface.typescriptreact", { fg = colors.cyan, bg = "NONE" })
hl(0, "@lsp.type.namespace.typescriptreact", { fg = colors.cyan, bg = "NONE" })
hl(0, "@lsp.typemod.variable.readonly.typescriptreact", { fg = colors.fg, bg = "NONE" })
hl(0, "@keyword.import.tsx", { fg = colors.fg, bg = "NONE", bold = true })
hl(0, "@tag.tsx", { fg = colors.cyan, bg = "NONE" })
hl(0, "@tag.jsx", { fg = colors.cyan, bg = "NONE" })

hl(0, "typescriptArrowFuncArg", { fg = colors.fg, bg = "NONE" })
hl(0, "typescriptCall", { fg = colors.fg, bg = "NONE" })
hl(0, "typescriptTemplateSB", { fg = colors.purple, bg = "NONE" })
hl(0, "typescriptBraces", { fg = colors.fg, bg = "NONE" })

hl(0, "@tag.tsx", { fg = colors.cyan, bg = "NONE" })
hl(0, "@tag.jsx", { fg = colors.cyan, bg = "NONE" })

-- CSS
hl(0, "@string.special.css", { fg = colors.dark_yellow, bg = "NONE" })
hl(0, "@type.definition.css", { fg = colors.fg, bg = "NONE" })

-- Rust
hl(0, "rustEnumVariant", { fg = colors.cyan, bg = "NONE" })
hl(0, "rustSigil", { fg = colors.fg, bg = "NONE" })
hl(0, "rustEscape", { link = "String" })
hl(0, "@lsp.type.formatSpecifier.rust", { link = "@punctuation.special" })
hl(0, "@lsp.mod.asyncolors.rust", { fg = colors.purple, bg = "NONE" })
hl(0, "@lsp.typemod.function.declaration.rust", { fg = colors.yellow, bg = "NONE" })
hl(0, "@type.qualifier.rust", { fg = colors.fg, bg = "NONE" })
hl(0, "@lsp.typemod.method.reference.rust", { fg = colors.yellow, bg = "NONE" })
hl(0, "@lsp.typemod.keyword.controlFlow.rust", { fg = colors.purple, bg = "NONE" })
hl(0, "@lsp.typemod.decorator.library.rust", { fg = colors.yellow, bg = "NONE" })
hl(0, "@lsp.typemod.function.asyncolors.rust", { fg = colors.yellow, bg = "NONE" })

-- toml
hl(0, "@type.toml", { fg = colors.cyan, bg = "NONE" })

-- html
hl(0, "@markup.heading.html", { fg = colors.fg, bg = "NONE" })
hl(0, "@markup.heading.1.html", { fg = colors.fg, bg = "NONE" })
hl(0, "@markup.heading.2.html", { fg = colors.fg, bg = "NONE" })
hl(0, "@markup.heading.3.html", { fg = colors.fg, bg = "NONE" })
hl(0, "@markup.heading.4.html", { fg = colors.fg, bg = "NONE" })
hl(0, "@markup.heading.5.html", { fg = colors.fg, bg = "NONE" })
hl(0, "@markup.heading.6.html", { fg = colors.fg, bg = "NONE" })

-- zsh
hl(0, "zshCommands", { fg = colors.yellow, bg = "NONE" })
hl(0, "zshDeref", { fg = colors.fg, bg = "NONE" })
hl(0, "zshShortDeref", { fg = colors.fg, bg = "NONE" })
hl(0, "zshSubst", { fg = colors.fg, bg = "NONE" })
hl(0, "zshVariableDef", { fg = colors.fg, bg = "NONE" })
hl(0, "zshSubstDelim", { link = "@punctuation.special" })
hl(0, "zshKSHFunction", { link = "Function" })

-- nginx
hl(0, "ngxComment", { fg = colors.green_1, bg = "NONE" })
hl(0, "ngxDirective", { fg = colors.fg, bg = "NONE" })
hl(0, "ngxDirectiveThirdParty", { fg = colors.fg, bg = "NONE" })
hl(0, "ngxDirectiveBlock", { fg = colors.blue, bg = "NONE" })
hl(0, "ngxBlock", { fg = colors.cyan, bg = "NONE" })
hl(0, "ngxDirectiveImportant", { fg = colors.purple, bg = "NONE" })

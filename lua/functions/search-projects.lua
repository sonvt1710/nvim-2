local function search_projects()
	local history = require("project_nvim.utils.history")
	local recent_projects = history.get_recent_projects()

	local items = {}
	for _, project_path in ipairs(recent_projects) do
		local project_name = vim.fn.fnamemodify(project_path, ":t")
		table.insert(items, {
			text = string.format("%-30s %s", project_name, project_path),
			path = project_path,
		})
	end

	Snacks.picker.pick({
		source = "projects",
		items = items,
		format = "text",
		confirm = function(picker, item)
			picker:close()
			if item and item.path then
				vim.cmd("cd " .. vim.fn.fnameescape(item.path))
				vim.cmd("bufdo bd")
				vim.cmd("Neotree reveal")
			end
		end,
	})
end

vim.api.nvim_create_user_command("Projects", search_projects, {})

vim.keymap.set("n", "<leader>fp", search_projects, { desc = "Find projects" })

local files = vim.fn.glob(vim.fn.stdpath("config") .. "/lua/plugins/*.lua", false, true)
local function modname(file)
	return file:match("lua[/\\](.+)%.lua$"):gsub("[/\\]", ".")
end

local all_plugins = {}
local all_config_aheads = {}
local all_configs = {}

table.sort(files)

-- traverse plugin files
for _, file in ipairs(files) do
	local f = require(modname(file))

	if f.plugins then
		vim.list_extend(all_plugins, f.plugins)
	end

	if f.config_ahead then
		table.insert(all_config_aheads, f.config_ahead)
	end

	if f.config then
		table.insert(all_configs, f.config)
	end
end

-- install plugins
vim.pack.add(all_plugins)

-- run config_aheads
for _, config in ipairs(all_config_aheads) do
	config()
end

-- run configs
for _, config in ipairs(all_configs) do
	config()
end

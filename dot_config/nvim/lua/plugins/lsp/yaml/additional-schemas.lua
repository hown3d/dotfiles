local curl = require("plenary.curl")
local M = {
  schemas_catalog = "datreeio/CRDs-catalog",
  schema_catalog_branch = "main",
  github_base_api_url = "https://api.github.com/repos",
  github_headers = {
    Accept = "application/vnd.github+json",
    ["X-GitHub-Api-Version"] = "2022-11-28",
  },
}

local function get_keys(t)
  local keys = {}
  for key, _ in pairs(t) do
    table.insert(keys, key)
  end
  return keys
end

local function table_merge(t1, t2)
  for _, v in ipairs(t2) do
    table.insert(t1, v)
  end
  return t1
end
M.schema_url = "https://raw.githubusercontent.com/" .. M.schemas_catalog .. "/" .. M.schema_catalog_branch

M.list_github_tree = function()
  local url = M.github_base_api_url .. "/" .. M.schemas_catalog .. "/git/trees/" .. M.schema_catalog_branch
  local response = curl.get(url, { headers = M.github_headers, query = { recursive = 1 } })
  local body = vim.fn.json_decode(response.body)
  local trees = {}
  for _, tree in ipairs(body.tree) do
    if tree.type == "blob" and tree.path:match("%.json$") then
      table.insert(trees, tree.path)
    end
  end
  return trees
end

M.list_schemastore = function()
  local url = "https://www.schemastore.org/api/json/catalog.json"
  local response = curl.get(url, { headers = { Accept = "application/json" } })
  local body = vim.fn.json_decode(response.body)
  local schemas = {}
  for _, schema in ipairs(body.schemas) do
    schemas[schema.name] = schema.url
  end
  return schemas
end

M.init = function()
  local all_crds = M.list_github_tree()
  local schemas = M.list_schemastore()
  vim.ui.select(table_merge(all_crds, get_keys(schemas)), { prompt = "Select schema: " }, function(selection)
    if not selection then
      vim.notify("Canceled.", vim.log.levels.WARN, {})
      return
    end
    local schema_url = M.schema_url .. "/" .. selection
    if schemas[selection] ~= nil then
      schema_url = schemas[selection]
    end

    local schema_modeline = "# yaml-language-server: $schema=" .. schema_url
    vim.api.nvim_buf_set_lines(0, 0, 0, false, { schema_modeline })
    vim.notify("Added schema modeline: " .. schema_modeline)
  end)
end

return M

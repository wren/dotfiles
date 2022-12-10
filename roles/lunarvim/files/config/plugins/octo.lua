-- Manage github issues and PRs from editor
local plugin = { 'pwntester/octo.nvim' }

plugin.cmd = {
  'Octo',
  'OctoAddReviewComment',
  'OctoAddReviewSuggestion',
}

table.insert(lvim.plugins, plugin)

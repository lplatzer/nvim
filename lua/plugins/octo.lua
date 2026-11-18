-- Octo (GitHub issues and PR reviews) comes from the LazyVim extra in lazyvim.json.
-- The extra sets squash as the merge method. Squashing a PR that others are stacked on
-- rewrites its commits and leaves conflicts in the PRs above it; a merge commit doesn't.
return {
  "pwntester/octo.nvim",
  opts = {
    default_merge_method = "merge",
  },
}

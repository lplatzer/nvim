-- diffview+ is the maintained fork of sindrets/diffview.nvim, which has had no commits
-- since June 2024. It shows a whole branch in one tab: changed files on the left, a
-- side-by-side diff on the right. q closes it.

-- The branch to compare against: origin/HEAD if the clone has it, else main or master.
local function default_branch()
  for _, ref in ipairs({ "origin/HEAD", "origin/main", "origin/master", "main", "master" }) do
    vim.fn.system({ "git", "rev-parse", "--verify", "--quiet", ref })
    if vim.v.shell_error == 0 then
      return ref
    end
  end
  return "HEAD"
end

local close = { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } }

return {
  "dlyongemallo/diffview-plus.nvim",
  main = "diffview",
  version = "*",
  cmd = { "DiffviewOpen", "DiffviewToggle", "DiffviewFileHistory", "DiffviewClose" },
  keys = {
    {
      "<leader>gv",
      function()
        -- --imply-local puts the real files on the right, so LSP and edits work there.
        vim.cmd("DiffviewOpen " .. default_branch() .. "...HEAD --imply-local")
      end,
      desc = "Diffview: Branch vs Default Branch",
    },
    { "<leader>gV", "<cmd>DiffviewOpen<cr>", desc = "Diffview: Uncommitted Changes" },
    { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: File History" },
  },
  opts = {
    keymaps = {
      view = { close },
      file_panel = { close },
      file_history_panel = { close },
    },
  },
}

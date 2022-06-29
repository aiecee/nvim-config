local wk = require("which-key")

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Hop
map("i", "<C-h>l", "<cmd>HopLine<cr>")
map("i", "<C-h>w", "<cmd>HopWord<cr>")
map("i", "<C-h>p", "<cmd>HopPattern<cr>")
map("i", "<C-h>c", "<cmd>HopChar2<cr>")
map("n", "<C-h>l", "<cmd>HopLine<cr>")
map("n", "<C-h>w", "<cmd>HopWord<cr>")
map("n", "<C-h>p", "<cmd>HopPattern<cr>")
map("n", "<C-h>c", "<cmd>HopChar2<cr>")
map("v", "<C-h>l", "<cmd>HopLine<cr>")
map("v", "<C-h>w", "<cmd>HopWord<cr>")
map("v", "<C-h>p", "<cmd>HopPattern<cr>")
map("v", "<C-h>c", "<cmd>HopChar2<cr>")

-- Comments
map("n", "<C-k>l", "<cmd>lua require('Comment.api').toggle_current_linewise()<cr>")
map("n", "<C-k>b", "<cmd>lua require('Comment.api').toggle_current_blockwise()<cr>")
map("v", "<C-k>l", "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>")
map("v", "<C-k>b", "<esc><cmd>lua require('Comment.api').toggle_blockwise_op(vim.fn.visualmode())<cr>")

-- Quickfix
map("n", "<C-q>t", "<cmd>cw<cr>")
map("i", "<C-q>t", "<cmd>cw<cr>")
map("n", "<C-q>n", "<cmd>cn<cr>")
map("i", "<C-q>n", "<cmd>cn<cr>")
map("n", "<C-q>p", "<cmd>cp<cr>")
map("i", "<C-q>p", "<cmd>cp<cr>")
map("n", "<C-q>c", "<cmd>cexpr []<cr>")
map("i", "<C-q>c", "<cmd>cexpr []<cr>")

-- Normal Mode
wk.register({
  ["-"] = { "<cmd>Telescope comimands<cr>", "commands" },
  f = {
    name = "File",
    s = { "<cmd>w<cr>", "save" },
    a = { "<cmd>wa<cr>", "save all" },
    f = { "<cmd>Telescope find_files<cr>", "find file" },
    b = { "<cmd>Telescope file_browser<cr>", "file browser" },
    r = { "<cmd>Telescope oldfiles<cr>", "recently opened" },
  },
  t = {
    name = "Tree",
    t = { "<cmd>Neotree toggle<cr>", "toggle" },
    f = { "<cmd>Neotree focus<cr>", "focus" },
  },
  b = {
    name = "Buffers",
    l = { "<cmd>Telescope buffers<cr>", "list" },
    c = { "<cmd>bd<cr>", "close current" },
    n = { "<cmd>bn<cr>", "next" },
    p = { "<cmd>bp<cr>", "previous" },
  },
  x = {
    name = "Exit",
    q = { "<cmd>q<cr>", "quit" },
    s = { "<cmd>wq<cr>", "save and quit" },
    x = { "<cmd>qa<cr>", "exit" },
  },
  c = {
    name = "Code",
    b = { "<cmd>Telescope lsp_definitions<cr>", "go to definition" },
    i = { "<cmd>Telescope lsp_implementations<cr>", "go to implementations" },
    r = { "<cmd>Telescope lsp_references<cr>", "all references" },
    d = {
      name = "Diagnostics",
      b = { "<cmd>Telescope diagnostics<cr>", "buffer diagnostics" },
      l = { "<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<cr>", "line diagnostics" },
    },
    f = { "<cmd>lua vim.lsp.buf.formatting_sync(nil, 5000)<cr>", "format" },
    a = { "<cmd>lua require('lspsaga.codeaction').code_action()<cr>", "code actions" },
    R = { "<cmd>lua require('lspsaga.rename').rename()<cr>", "rename" },
    h = { "<cmd>lua require('lspsaga.hover').render_hover_doc()<cr>", "hover" },
    s = { "<cmd>lua require('lspsaga.signaturehelp').signature_help()<cr>", "signature help" },
    t = { "<cmd>TodoTelescope<cr>", "todos" },
    u = { "<cmd>set ff=unix<cr>", "to unix" },
    o = { "<cmd>SymbolsOutline<cr>", "toggle symbols"},

  },
  g = {
    name = "Git",
    c = {
      name = "Commits",
      c = { "<cmd>Telescope git_commits<cr>", "commits" },
      b = { "<cmd>Telescope git_bcommits<cr>", "buffer commits" },
    },
    b = { "<cmd>Telescope git_branches<cr>", "branches" },
    s = { "<cmd>NeoTreeFloat git_status<cr>", "status" },
    f = { "<cmd>Telescope git_files<cr>", "files" },
    g = { "<cmd>lua require('aiecee.config.fterm').toggle_git()<cr>", "lazygit" },
    w = {
      name = "Worktrees",
      w = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "worktrees" },
      c = { "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "create" },
    },
  },
  s = {
    name = "Search",
    f = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "current file" },
    c = { "<cmd>Telescope grep_string<cr>", "word under cursor" },
    w = { "<cmd>Telescope live_grep<cr>", "current working dir" },
  },
  w = {
    name = "Window",
    ["="] = { "<cmd>wincmd =<cr>", "format windows" },
    h = { "<cmd>wincmd h<cr>", "go to the left window" },
    j = { "<cmd>wincmd j<cr>", "go to the down window" },
    k = { "<cmd>wincmd k<cr>", "go to the up window" },
    l = { "<cmd>wincmd l<cr>", "go to the right window" },
    w = { "<cmd>wincmd w<cr>", "switch windows" },
    s = { "<cmd>wincmd w<cr>", "split window" },
    v = { "<cmd>wincmd v<cr>", "split window vertically" },
    q = { "<cmd>wincmd q<cr>", "quit window" },
    x = { "<cmd>wincmd x<cr>", "swap windows" },
  },
  z = {
    name = "Zen Mode",
    t = { "<cmd>Twilight<cr>", "toggle twilight" },
    z = { "<cmd>ZenMode<cr>", "toggle zen mode" },
  },
  m = {
    name = "Marks",
    a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "add file" },
    n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "next" },
    p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "previous" },
    l = { "<cmd>Telescope harpoon marks theme=dropdown<cr>", "list" }, -- theme needs to be set here, can't do it in config
  },
  h = {
    name = "Hop",
    w = { "<cmd>HopWord<cr>", "word" },
    l = { "<cmd>HopLine<cr>", "line" },
    p = { "<cmd>HopPattern<cr>", "pattern" },
    c = { "<cmd>HopChar2<cr>", "char2" },
  },
  q = {
    name = "Quickfix",
    t = { "<cmd>cw<cr>", "toggle" },
    n = { "<cmd>cn<cr>", "next" },
    p = { "<cmd>cp<cr>", "previous" },
    c = { "<cmd>cexpr []<cr>", "clear" },
  }
}, {
  prefix = "<leader>",
})

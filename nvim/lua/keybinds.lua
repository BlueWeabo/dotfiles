local N = "n"
local V = "v"
local I = "i"
local X = "x"
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set(N, "<leader>pv", vim.cmd.Ex)

vim.keymap.set(V, "J", ":m '>+1<CR>gv=gv")
vim.keymap.set(V, "K", ":m '<-2<CR>gv=gv")

vim.keymap.set(N, "J", "mzJ`z")
vim.keymap.set(N, "<C-d>", "<C-d>zz")
vim.keymap.set(N, "<C-u>", "<C-u>zz")
vim.keymap.set(N, "n", "nzzzv")
vim.keymap.set(N, "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set(X, "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({N, V}, "<leader>y", [["+y]])
vim.keymap.set(N, "<leader>Y", [["+Y]])

vim.keymap.set({N, V}, "<leader>d", [["_d]])

vim.keymap.set(N, "Q", "<nop>")
vim.keymap.set(N, "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set(N, "<leader>f", vim.lsp.buf.format)

vim.keymap.set(N, "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set(N, "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set(N, "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set(N, "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set(N, "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set(N, "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set(N, "<leader><leader>", function()
    vim.cmd("so")
end)

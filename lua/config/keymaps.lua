-- ================================
--         Key Mapping Configuration
-- ================================

local keymap = vim.keymap
 
-- Set leader key to space
vim.g.mapleader = " "

-- Insert Mode Mappings
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })                        -- Exit insert mode

-- General Mappings
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })             -- Clear search highlights
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })                -- Split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })              -- Split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })                 -- Make split windows equal size
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })            -- Close current split window

-- Tab Management Mappings
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                  -- Open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })           -- Close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                  -- Go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })              -- Go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) -- Move current buffer to new tab

-- Navigation Mappings
keymap.set("n", "<C-j>", "10j", { desc = "Move down 10 lines" })                            -- Move down 10 lines
keymap.set("n", "<C-k>", "10k", { desc = "Move up 10 lines" })                              -- Move up 10 lines
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })                          -- Go to left window
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })                         -- Go to right window

-- Copy and Paste Mappings
keymap.set("n", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })                  -- Copy to system clipboard
keymap.set("n", "<leader>p", "\"+p", { desc = "Paste from system clipboard" })                -- Paste from system clipboard
keymap.set("v", "<leader>y", "\"+y", { desc = "Yank selected text to system clipboard" })    -- Copy selected text
keymap.set("v", "<leader>p", "\"+p", { desc = "Paste from system clipboard in visual mode" }) -- Paste in visual mode

-- File Management Mappings
keymap.set("n", "<leader>fs", ":w<CR>", { desc = "Save file" })                              -- Save current file
keymap.set("n", "<leader>fq", ":q<CR>", { desc = "Quit current buffer" })                    -- Quit current buffer
keymap.set("n", "<leader>fQ", ":qa<CR>", { desc = "Quit all buffers" })                      -- Quit all buffers

-- Miscellaneous Mappings
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files with Telescope" }) -- Find files with Telescope
keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep with Telescope" })   -- Live grep with Telescope
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "List buffers with Telescope" })  -- List buffers with Telescope
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Find help tags with Telescope" }) -- Find help tags with Telescope

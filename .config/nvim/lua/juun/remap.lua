
local function setall(key, what)
	vim.keymap.set("n", key, what)
	vim.keymap.set("i", key, what)
end

setall("<C-x>", vim.cmd.Ex)
setall("<S-left>", "<Home>")
setall("<S-right>", "<End>")
setall("<S-up>", "<PageUp>")
setall("<S-down>", "<PageDown>")
setall("<A-left>", "<C-PageUp>")
setall("<A-right>", "<C-PageDown>")




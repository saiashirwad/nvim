local M = {}

M.set_keymaps = function(keymaps)
  for mode, mode_keymaps in ipairs(keymaps) do
    for _, keymap in ipairs(mode_keymaps) do
      vim.keymap.set(mode, keymap[1], keymap[2], {
        silent = true,
        remap = true,
      })
    end
  end
end

return M

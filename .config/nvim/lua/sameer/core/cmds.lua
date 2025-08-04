vim.api.nvim_create_user_command("Reload", function()
  for name, _ in pairs(package.loaded) do
    if name:match("^sameer%.") then
      package.loaded[name] = nil
    end
  end
  dofile(vim.env.MYVIMRC)
  print("Config reloaded 🔁")
end, {})

hl.on("hyprland.start", function()
  hl.exec_cmd("systemctl --user start hyprland-session.target")
end)
hl.on("hyprland.shutdown", function()
  hl.exec_cmd("systemctl --user stop hyprland-session.target")
end)


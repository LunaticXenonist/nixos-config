hl.monitor({
  output = "DP-2",
  mode = "2560x1440@164.55400",
  position = "0x0",
  scale = 1,
})
hl.monitor({
  output = "DP-1",
  mode = "1920x1080@143.98",
  position = "2560x360",
  scale = 1,
})
hl.monitor({
  output = "HDMI-A-1",
  mode = preferred,
  position = auto,
  scale = 1,
})


hl.workspace_rule({workspace = r[1-2], monitor = "DP-2"})
hl.workspace_rule({workspace = r[3-4], monitor = "DP-1"})

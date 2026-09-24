local store = require("store")

-- specific programs
hl.bind("SUPER + R", hl.dsp.exec_cmd(store.wofi.." --show=run"))
hl.bind("SUPER + Q", hl.dsp.exec_cmd(store.kitty))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd(store.mako.." dismiss -a"))

-- misc commands
hl.bind("SUPER + C", hl.dsp.window.close(activewindow))
hl.bind("SUPER + M", hl.dsp.exec_cmd(store.hyprshutdown))

-- window management
hl.bind("SUPER + F", 
  hl.dsp.window.fullscreen(fullscreen, toggle, true, activewindow))

-- todo: learn how functions work and fix this
hl.bind("SUPER + 1", hl.dsp.focus({workspace = 1}))
hl.bind("SUPER + 2", hl.dsp.focus({workspace = 2}))
hl.bind("SUPER + 3", hl.dsp.focus({workspace = 3}))
hl.bind("SUPER + 4", hl.dsp.focus({workspace = 4}))
hl.bind("SUPER + 5", hl.dsp.focus({workspace = 5}))
hl.bind("SUPER + 6", hl.dsp.focus({workspace = 6}))
hl.bind("SUPER + 7", hl.dsp.focus({workspace = 7}))
hl.bind("SUPER + 8", hl.dsp.focus({workspace = 8}))
hl.bind("SUPER + 9", hl.dsp.focus({workspace = 9}))
hl.bind("SUPER + 0", hl.dsp.focus({workspace = 10}))

hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({window = activewindow, workspace = 1}))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({window = activewindow, workspace = 2}))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({window = activewindow, workspace = 3}))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({window = activewindow, workspace = 4}))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({window = activewindow, workspace = 5}))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({window = activewindow, workspace = 6}))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({window = activewindow, workspace = 7}))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({window = activewindow, workspace = 8}))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({window = activewindow, workspace = 9}))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({window = activewindow, workspace = 10}))

-- picture management
hl.bind("SHIFT + PRINT", 
  hl.dsp.exec_cmd(store.hyprshot.." -m window -m active --clipboard-only"))
hl.bind("PRINT", 
  hl.dsp.exec_cmd(store.hyprshot.." -m window -m active -o ~/Pictures/Screenshots"))
hl.bind("SUPER + SHIFT + PRINT", 
  hl.dsp.exec_cmd(store.hyprshot.." -m output --clipboard-only"))
hl.bind("SUPER + PRINT", 
  hl.dsp.exec_cmd(store.hyprshot.." -m output -o ~/Pictures/Screenshots"))
hl.bind("ALT + SHIFT + PRINT", 
  hl.dsp.exec_cmd(store.hyprshot.." -m region --clipboard-only"))
hl.bind("ALT + PRINT", 
  hl.dsp.exec_cmd(store.hyprshot.." -m region -o ~/Pictures/Screenshots"))

-- Brightness
hl.bind("XF86MonBrightnessUp", 
  hl.dsp.exec_cmd(store.brillo.." -A 5 -u 10000"))
hl.bind("XF86MonBrightnessDown", 
  hl.dsp.exec_cmd(store.brillo.." -U 5 -u 10000"))

-- Media
hl.bind("XF86AudioPlay", 
  hl.dsp.exec_cmd(store.player.." play-pause"))
hl.bind("XF86AudioNext", 
  hl.dsp.exec_cmd(store.player.." next"))
hl.bind("XF86AudioPrev", 
  hl.dsp.exec_cmd(store.player.." previous"))
hl.bind("XF86AudioMute", 
  hl.dsp.exec_cmd(store.player.." volume 0"))


local store = require("store")
require("binds")
require("on")
require("hosts."..store.host)

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.window_rule({
  name = "suppress-maximize-events",
  match = {class = ".*"},
  suppress_event = "maximize",
  })

hl.config({
  general = {
    border_size = 2,
    gaps_in = 5,
    gaps_out = 10,
    col = {
      active_border = 
        {colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45},
      inactive_border = 0x595959aa
    }
  },
  decoration = {
    rounding = 5
  },
  misc = {
    disable_hyprland_logo = true;
    disable_splash_rendering = true;
  }
})



local wezterm = require 'wezterm'
local act = wezterm.action
local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

return {
  default_prog = { '/usr/bin/zsh', '-l' },
  pane_focus_follows_mouse = false,
  keys = {
    {
      key = 'c',
      mods = 'CTRL',
      action = wezterm.action_callback(function(window, pane)
        local has_selection = window:get_selection_text_for_pane(pane) ~= ''
        if has_selection then
          window:perform_action(
            act.CopyTo 'ClipboardAndPrimarySelection',
            pane
          )

          window:perform_action(act.ClearSelection, pane)
        else
          window:perform_action(
            act.SendKey { key = 'c', mods = 'CTRL' },
            pane
          )
        end
      end),
    },
    -- open new tab
    {
      key = 't',
      mods = 'SHIFT|ALT',
      action = act.SpawnTab 'CurrentPaneDomain',
    },
    { key = 't', 
      mods = 'SHIFT|ALT', 
      action = act.SpawnTab 'DefaultDomain' 
    },
    {
      key = 't',
      mods = 'SHIFT|ALT',
      action = act.SpawnTab { DomainName = 'unix', },
    },
    -- switch tabs
    { 
      key = 'LeftArrow', 
      mods = 'CTRL|SHIFT', 
      action = act.ActivateTabRelative(-1) 
    },
    { 
      key = 'RightArrow', 
      mods = 'CTRL|SHIFT', 
      action = act.ActivateTabRelative(1) 
    },
    -- close tab
    {
      key = 'x',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.CloseCurrentTab { confirm = true },
    },
    -- open new pane
    {
      key = '2',
      mods = 'CTRL',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = '3',
      mods = 'CTRL',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    -- close pane
    {
      key = 'x',
      mods = 'CTRL',
      action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    -- switch panes
    {
      key = 'LeftArrow',
      mods = 'CTRL',
      action = act.ActivatePaneDirection 'Left',
    },
    {
      key = 'RightArrow',
      mods = 'CTRL',
      action = act.ActivatePaneDirection 'Right',
    },
    {
      key = 'UpArrow',
      mods = 'CTRL',
      action = act.ActivatePaneDirection 'Up',
    },
    {
      key = 'DownArrow',
      mods = 'CTRL',
      action = act.ActivatePaneDirection 'Down',
    },
    -- zoom
    { 
      key = '+', 
      mods = 'CTRL', 
      action = wezterm.action.IncreaseFontSize 
    },
    { 
      key = '-', 
      mods = 'CTRL', 
      action = wezterm.action.DecreaseFontSize 
    },
    -- fullscreen
    {
      key = 'm',
      mods = 'CTRL',
      action = wezterm.action.ToggleFullScreen,
    },
    -- fullscreen pane
    {
      key = 'n',
      mods = 'CTRL',
      action = wezterm.action.TogglePaneZoomState,
    },
  },
  window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0,
  },
  window_frame = {
    border_left_width = '0.5cell',
    border_right_width = '0.5cell',
  },
  font_size = 15,
  color_scheme = 'Material Darker (base16)',
  show_update_window = false,
}

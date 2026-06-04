-----------------------------
--- ENVIRONMENT VARIABLES ---
-----------------------------

-- See https://wiki.hypr.land/Configuring/Environment-variables/
package.path = package.path .. ";./config.d/?.lua"  -- NOTE: Allow loading configuration files from config.d, by name

hl.env('NVD_BACKEND', 'direct')
hl.env('LIBVA_DRIVER_NAME', 'nvidia')
hl.env('__GLX_VENDOR_LIBRARY_NAME', 'nvidia')

hl.env('HYPRCURSOR_SIZE', '24')
hl.env('HYPRCURSOR_THEME', 'Empty')
hl.env('XCURSOR_SIZE', '24')
hl.env('XCURSOR_THEME', 'Empty')

-- env = NVD_BACKEND,direct
-- env = LIBVA_DRIVER_NAME,nvidia
-- env = __GLX_VENDOR_LIBRARY_NAME,nvidia
-- env = XCURSOR_SIZE,24
-- env = HYPRCURSOR_SIZE,24
-- env = HYPRCURSOR_THEME,Empty-Butterfly-Yellow-vr2
-- env = XCURSOR_THEME,Empty-Butterfly-Yellow-vr2


----------------
--- MONITORS ---
----------------

require('monitors')

-------------------
--- MY PROGRAMS ---
-------------------

-- See https://wiki.hypr.land/Configuring/Keywords/

-- Set programs that you use
local closeWindowBind  = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
local fileManager      = "pcmanfm"
local mainMod          = "SUPER" -- Sets "Windows" key as main modifier
local menu             = "rofi -show drun"
local terminal         = "st"
local webBrowser       = "brave"

-----------------
--- AUTOSTART ---
-----------------

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

-- exec-once = hyprpaper -c $XH/hypr/config.d/hyprpaper.conf
-- exec-once = bash -c $XH/eww/scripts/start_ws_mon
-- exec-once = bash -c $XH/eww/scripts/rebar
-- exec-once = dunst -config $XH/dunst/dunstrc
-- exec-once = hyprlock -c $XH/hypr/config.d/lock/login.conf

hl.on("hyprland.start", function ()
	hl.exec_cmd("hyprpaper -c $XH/hypr/config.d/hyprpaper.conf")
	hl.exec_cmd("bash -c $XH/eww/scripts/start_ws_mon")
	hl.exec_cmd("bash -c $XH/eww/scripts/rebar")
	hl.exec_cmd("dunst -config $XH/dunst/dunstrc")
	hl.exec_cmd("hyprlock -c $XH/hypr/config.d/lock/login.conf")
end)


-------------------
--- PERMISSIONS ---
-------------------

-- See https://wiki.hypr.land/Configuring/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
-- 	ecosystem = {
-- 	  enforce_permissions = true,
-- 	},
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")


---------------------
--- LOOK AND FEEL ---
---------------------

-- Refer to https://wiki.hypr.land/Configuring/Variables/
-- https://wiki.hypr.land/Configuring/Variables/#general

hl.config({
	general = {
	    gaps_in  = 5,
	    gaps_out = 5,

	    border_size = 1,

	    -- https://wiki.hypr.land/Configuring/Variables/--variable-types for info about colors
	    col = {
			active_border   = { colors = { "rgba(26c06dee)", "rgba(80a0ffee)" }, angle = 135 },
	   	inactive_border = "rgba(80a0ff55)",
		},

	    -- Set to true enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

	    -- Please see https://wiki.hypr.land/Configuring/Tearing/ before you turn this on
		allow_tearing = false,

	    layout = "dwindle",
	},

	-- https://wiki.hypr.land/Configuring/Variables/#decoration
	decoration = {
		rounding       = 10,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity   = 1.0,
		inactive_opacity = 1.0,

		shadow = {
		    enabled      = true,
		    range        = 4,
		    render_power = 3,
		    color        = "rgba(1a1a1aee)",
		},

		-- https://wiki.hypr.land/Configuring/Variables/--blur
		blur = {
		    enabled  = true,
		    size     = 3,
		    passes   = 1,

		    vibrancy = 0.1696,
		},
	},

	-- https://wiki.hypr.land/Configuring/Variables/#animations
	animations = {
		enabled = true,
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- animations {
--     enabled = yes, please :)
--
--     # Default curves, see https://wiki.hypr.land/Configuring/Animations/#curves
--     #        NAME,           X0,   Y0,   X1,   Y1
--     bezier = easeOutQuint,   0.23, 1,    0.32, 1
--     bezier = easeInOutCubic, 0.65, 0.05, 0.36, 1
--     bezier = linear,         0,    0,    1,    1
--     bezier = almostLinear,   0.5,  0.5,  0.75, 1
--     bezier = quick,          0.15, 0,    0.1,  1
--
--     # Default animations, see https://wiki.hypr.land/Configuring/Animations/
--     #           NAME,          ONOFF, SPEED, CURVE,        [STYLE]
--     animation = global,        1,     10,    default
--     animation = border,        1,     5.39,  easeOutQuint
--     animation = windows,       1,     4.79,  easeOutQuint
--     animation = windowsIn,     1,     4.1,   easeOutQuint, popin 87%
--     animation = windowsOut,    1,     1.49,  linear,       popin 87%
--     animation = fadeIn,        1,     1.73,  almostLinear
--     animation = fadeOut,       1,     1.46,  almostLinear
--     animation = fade,          1,     3.03,  quick
--     animation = layers,        1,     3.81,  easeOutQuint
--     animation = layersIn,      1,     4,     easeOutQuint, fade
--     animation = layersOut,     1,     1.5,   linear,       fade
--     animation = fadeLayersIn,  1,     1.79,  almostLinear
--     animation = fadeLayersOut, 1,     1.39,  almostLinear
--     animation = workspaces,    1,     1.94,  almostLinear, fade
--     animation = workspacesIn,  1,     1.21,  almostLinear, fade
--     animation = workspacesOut, 1,     1.94,  almostLinear, fade
--     animation = zoomFactor,    1,     7,     quick
-- }


------------
--- MISC ---
------------

hl.config({
	-- See https://wiki.hypr.land/Configuring/Dwindle-Layout/ for more
	dwindle = {
	    -- pseudotile     = true -- Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
	    preserve_split = true, -- You probably want this
	},

	-- See https://wiki.hypr.land/Configuring/Master-Layout/ for more
	master = {
	    new_status = "master",
	},

	-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
	scrolling = {
		fullscreen_on_one_column = true,
	},

	-- https://wiki.hypr.land/Configuring/Variables/#misc
	misc = {
		force_default_wallpaper = 0,     -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
	},
})


-------------
--- INPUT ---
-------------

hl.config({
	-- https://wiki.hypr.land/Configuring/Variables/#input
	input = {
	    kb_layout  = "us",
	    kb_variant = "",
	    kb_model   = "",
	    kb_options = "caps:super,compose:ralt",
	    kb_rules   = "",

	    follow_mouse = 1,
	    sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.

	    touchpad = {
	        natural_scroll = false,
	    },
	},

})

-- See https://wiki.hypr.land/Configuring/Gestures
hl.gesture({
	fingers   = 3,
	direction = "horizontal",
	action    = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Keywords/#per-device-input-configs for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


-------------------
--- KEYBINDINGS ---
-------------------


-- bind = $mainMod, Return, exec, $terminal
-- bind = $mainMod, B, exec, $webBrowser
-- bind = $mainMod, E, exec, $fileManager
-- bind = $mainMod, D, exec, $menu
-- bind = $mainMod, R, exec, rofi -show run
-- bind = $mainMod SHIFT, P, exec, eww open power_menu
-- bind = $mainMod SHIFT, x, exec, $HOME/.local/bin/lock
-- bind = $mainMod, mouse:274, exec, dunst-playback

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B",      hl.dsp.exec_cmd(webBrowser))
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D",      hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("rofi -show run"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("eww open power_menu"))
hl.bind(mainMod .. " + SHIFT + x", hl.dsp.exec_cmd("lock"))
hl.bind(mainMod .. " + mouse:274", hl.dsp.exec_cmd("dunst-playback"))

-- Group windows --
hl.bind(mainMod .. " + T",   hl.dsp.group.toggle())         -- bind = $mainMod, t, togglegroup
hl.bind(mainMod .. " + TAB", hl.dsp.layout("togglesplit"))  -- bind = $mainMod, TAB, layout, togglesplit  # dwindle

-- Move to the other members of an active group --
hl.bind(mainMod .. " + H", hl.dsp.group.prev())  -- bind = $mainMod ALT, h, changegroupactive, b
hl.bind(mainMod .. " + L", hl.dsp.group.next())  -- bind = $mainMod ALT, l, changegroupactive, f

-- Move focus with mainMod + vim directions
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))  -- bind = $mainMod, l, movefocus, r
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left"  }))  -- bind = $mainMod, h, movefocus, l
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up"    }))  -- bind = $mainMod, k, movefocus, u
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down"  }))  -- bind = $mainMod, j, movefocus, d

-- Resize Windows with mod+ctl [h, j, k, l]
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.resize({ x = -50 }))      -- bind = $mainMod CTRL, h, resizeactive, -50 0
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.resize({ y =  50 }))      -- bind = $mainMod CTRL, j, resizeactive, 0 50
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.resize({ y = -50 }))      -- bind = $mainMod CTRL, k, resizeactive, 0 -50
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.resize({ x =  50 }))      -- bind = $mainMod CTRL, l, resizeactive, 50 0
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.resize({ x = -10 }))  -- bind = $mainMod CTRL, left, resizeactive, -10 0
hl.bind(mainMod .. " + CTRL + down",  hl.dsp.window.resize({ y =  10 }))  -- bind = $mainMod CTRL, down, resizeactive, 0 10
hl.bind(mainMod .. " + CTRL + up",    hl.dsp.window.resize({ y = -10 }))  -- bind = $mainMod CTRL, up, resizeactive, 0 -10
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({ x =  10 }))  -- bind = $mainMod CTRL, right, resizeactive, 10 0

-- Move Windows
hl.bind(mainMod .. " + H", hl.dsp.window.move({ direction = "left"  }))  -- bind = $mainMod SHIFT, H, movewindoworgroup, l
hl.bind(mainMod .. " + J", hl.dsp.window.move({ direction = "down"  }))  -- bind = $mainMod SHIFT, J, movewindoworgroup, d
hl.bind(mainMod .. " + K", hl.dsp.window.move({ direction = "up"    }))  -- bind = $mainMod SHIFT, K, movewindoworgroup, u
hl.bind(mainMod .. " + L", hl.dsp.window.move({ direction = "right" }))  -- bind = $mainMod SHIFT, L, movewindoworgroup, r

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10  -- 10 maps to key 0

	hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Switch workspaces with mainMod + [0-9]
-- bind = $mainMod, 1, workspace, 1
-- bind = $mainMod, 2, workspace, 2
-- bind = $mainMod, 3, workspace, 3
-- bind = $mainMod, 4, workspace, 4
-- bind = $mainMod, 5, workspace, 5
-- bind = $mainMod, 6, workspace, 6
-- bind = $mainMod, 7, workspace, 7
-- bind = $mainMod, 8, workspace, 8
-- bind = $mainMod, 9, workspace, 9
-- bind = $mainMod, 0, workspace, 10

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
-- bind = $mainMod SHIFT, 1, movetoworkspace, 1
-- bind = $mainMod SHIFT, 2, movetoworkspace, 2
-- bind = $mainMod SHIFT, 3, movetoworkspace, 3
-- bind = $mainMod SHIFT, 4, movetoworkspace, 4
-- bind = $mainMod SHIFT, 5, movetoworkspace, 5
-- bind = $mainMod SHIFT, 6, movetoworkspace, 6
-- bind = $mainMod SHIFT, 7, movetoworkspace, 7
-- bind = $mainMod SHIFT, 8, movetoworkspace, 8
-- bind = $mainMod SHIFT, 9, movetoworkspace, 9
-- bind = $mainMod SHIFT, 0, movetoworkspace, 10

-- Window actions
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))             -- bind = $mainMod, V, togglefloating,
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen_state({ action = "toggle" }))  -- bind = $mainMod, F, fullscreen,
hl.bind("CTRL + print", hl.exec_cmd("screenshot 0"))                               -- bind = CTRL, print, exec, screenshot 0
hl.bind("print", hl.exec_cmd("screenshot 1"))                                      -- bind = , print, exec, screenshot 1
hl.bind("SHIFT + print", hl.exec_cmd("screenshot 2"))                              -- bind = SHIFT, print, exec, screenshot 2

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + code:49",        hl.dsp.workspace.toggle_special("magic"))              -- bind = CTRL, code:49, togglespecialworkspace, magic
hl.bind(mainMod .. " + CTRL + code:49", hl.dsp.window.move({ workspace = "special:magic" }))   -- bind = $mainMod CTRL, code:49, movetoworkspace, special:magic

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })  -- bindm = $mainMod, mouse:272, movewindow
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })  -- bindm = $mainMod, mouse:273, resizewindow

-- Laptop multimedia keys for volume and LCD brightness
bindel = $mainMod, mouse_down, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+
bindel = $mainMod, mouse_up, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-
bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
bindel = ,XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+
bindel = ,XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(mainMod .. " + mouse_down", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind(mainMod .. " + mouse_up", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires mpd, mpc, mpdn, ffmpeg
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("mpdn -n"), { locked = true })
hl.bind(mainMod .. " + N",  hl.dsp.exec_cmd("mpdn -n"), { locked = true })  -- bind = $mainMod, N, exec, mpdn -n 
hl.bind(mainMod .. " + mouse:276",  hl.dsp.exec_cmd("mpdn -n"), { locked = true })  -- bind = $mainMod, mouse:276, exec, mpdn -n
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("mpdn -P"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("mpdn -P"), { locked = true })
hl.bind(mainMod .. " + space",  hl.dsp.exec_cmd("mpdn -P"), { locked = true })  -- bind = $mainMod, SPACE, exec, mpdn -P
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("mpdn -p"), { locked = true })
hl.bind(mainMod .. " + P",  hl.dsp.exec_cmd("mpdn -p"), { locked = true })  -- bind = $mainMod, P, exec, mpdn -p
hl.bind(mainMod .. " + mouse:275",  hl.dsp.exec_cmd("mpdn -p"), { locked = true })  -- bind = $mainMod, mouse:275, exec, mpdn -p
hl.bind(mainMod .. " + M",  hl.dsp.exec_cmd("mpdn -k"), { locked = true })  -- bind = $mainMod, M, exec, mpdn -k

-- Play / Pause mpd ( [mpd_notify](https://github.com/briskbear/mpd_notify) )
-- bind = , code:172, exec, mpdn -P


--#############################
--## WINDOWS AND WORKSPACES ###
--#############################

bind = $mainMod, left,  movecurrentworkspacetomonitor, -1
bind = $mainMod, right, movecurrentworkspacetomonitor, +1

-- Example windowrules that are useful


windowrule {
    # Ignore maximize requests from all apps. You'll probably like this.
    name = suppress-maximize-events
    match:class = .*

    suppress_event = maximize
}

windowrule {
    # Fix some dragging issues with XWayland
    name             = fix-xwayland-drags

    match:class      = ^$
    match:title      = ^$
    match:xwayland   = true
    match:float      = true
    match:fullscreen = false
    match:pin        = false

    no_focus         = true
}

source = $XH/hypr/config.d/windowrules.conf

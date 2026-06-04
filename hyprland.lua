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
local terminal    = "st"
local fileManager = "pcmanfm"
local menu        = "rofi -show drun"
local webBrowser  = "brave"

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


--##################
--## KEYBINDINGS ###
--##################

$mainMod = SUPER # Sets "Windows" key as main modifier

bind = $mainMod, Return, exec, $terminal
bind = $mainMod, B, exec, $webBrowser
bind = $mainMod SHIFT, P, exec, eww open power_menu
bind = $mainMod SHIFT, x, exec, $HOME/.local/bin/lock
bind = $mainMod, E, exec, $fileManager
bind = $mainMod, D, exec, $menu
bind = $mainMod, R, exec, rofi -show run
bind = $mainMod, mouse:274, exec, $HOME/.local/bin/dunst-playback

--# Group windows ##
bind = $mainMod, t, togglegroup
-- bind = $mainMod, TAB, layout, togglesplit  # dwindle

--## Move to the other members of an active group
bind = $mainMod ALT, h, changegroupactive, b
bind = $mainMod ALT, l, changegroupactive, f

-- Move focus with mainMod + arrow keys
bind = $mainMod, l, movefocus, r
bind = $mainMod, h, movefocus, l
bind = $mainMod, k, movefocus, u
bind = $mainMod, j, movefocus, d

-- Resize Windows with mod+ctl [h, j, k, l]
bind = $mainMod CTRL, h, resizeactive, -50 0
bind = $mainMod CTRL, j, resizeactive, 0 50
bind = $mainMod CTRL, k, resizeactive, 0 -50
bind = $mainMod CTRL, l, resizeactive, 50 0
bind = $mainMod CTRL, left, resizeactive, -10 0
bind = $mainMod CTRL, down, resizeactive, 0 10
bind = $mainMod CTRL, up, resizeactive, 0 -10
bind = $mainMod CTRL, right, resizeactive, 10 0

-- Move Windows
bind = $mainMod SHIFT, H, movewindoworgroup, l
bind = $mainMod SHIFT, J, movewindoworgroup, d
bind = $mainMod SHIFT, K, movewindoworgroup, u
bind = $mainMod SHIFT, L, movewindoworgroup, r

-- Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

-- Window actions
bind = $mainMod, V, togglefloating,
bind = $mainMod SHIFT, Q, killactive,
bind = $mainMod, F, fullscreen,
bind = CTRL, print, exec, screenshot 0
bind = , print, exec, screenshot 1
bind = SHIFT, print, exec, screenshot 2

-- Example special workspace (scratchpad)
bind = CTRL, code:49, togglespecialworkspace, magic
bind = $mainMod CTRL, code:49, movetoworkspace, special:magic

-- Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

-- Laptop multimedia keys for volume and LCD brightness
bindel = $mainMod, mouse_down, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+
bindel = $mainMod, mouse_up, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-
bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
bindel = ,XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+
bindel = ,XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-

-- Play / Pause mpd ( [mpd_notify](https://github.com/briskbear/mpd_notify) )
bind = $mainMod, SPACE, exec, mpdn -P
bind = , code:172, exec, mpdn -P
bind = $mainMod, M, exec, mpdn -k
bind = $mainMod, mouse:276, exec, mpdn -n
bind = $mainMod, mouse:275, exec, mpdn -p
bind = $mainMod, N, exec, mpdn -n 
bind = $mainMod, P, exec, mpdn -p

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

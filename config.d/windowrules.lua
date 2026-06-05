hl.window_rule({
	name        = "Conky",

	float       = true,
	move        = "817 46",
	size        = "330 862",
	match = {
		class = "conky",
	},
	workspace   = "special:magic silent",
})

hl.window_rule({
	name        = "OpenFile",

	float       = true,
	match = {
		title = "^(Open File)$",
	},
	size        = "1118 647",
})

hl.window_rule({
	name        = "FileManager",

	float       = true,
	match = {
		class = "pcmanfm",
	},
	size        = "1270 682",
})

hl.window_rule({
	name        = "GParted",

	float       = true,
	match = {
		class = "gpartedbin",
	},
	size        = "1000 450",
})

hl.window_rule({
	name        = "DconfEditor",

	group       = "set",
	match = {
		class = "ca.desrt.dconf-editor",
	},
	workspace   = 10,
})

hl.window_rule({
	name        = "Discord",

	float       = false,
	center      = true,
	match = {
		class = "discord",
	},
	workspace   = 9,
})

hl.window_rule({
	name        = "ImageViewer",

	float       = true,
	match = {
		class = "feh",
	},
})

hl.window_rule({
	name        = "PasswordManager",

	float       = true,
	match = {
		class = "org.keepassxc.KeePassXC",
	},

	move        = "1212 46",
	size        = "800 823",
	workspace   = "special:magic silent",
})

hl.window_rule({
	name                = "RemoteDesktop",

	fullscreen_state    = 0,
	group               = "set",
	match = {
		initial_class = "^(org.remmina.Remmina)$",
	},
	workspace           = 5,
})

hl.window_rule({
	name                = "ImageEditor",

	match = {
		initial_class = "gimp",
	},
	workspace           = 6,
})

hl.window_rule({
	name        = "Terminal",

	match = {
		class = "St",
	},
	workspace   = 2,
})

hl.window_rule({
	name        = "Teams",

	match = {
		class = "teams-for-linux",
	},
	workspace   = 9,
})

hl.window_rule({
	name        = "Telegram",

	group       = "set",
	match = {
		class = "org.telegram.desktop",
	},
	workspace   = 9,
})

hl.window_rule({
	name        = "VirtualMachine",

	group       = "set",
	match = {
		class = "virt-manager",
	},
	workspace   = 5,
})

hl.window_rule({
	name        = "VolumeControl",

	match = {
		class = "com.saivert.pwvucontrol",
	},
	workspace   = 10,
})

hl.window_rule({
	name        = "Equalizer",

	group       = "set",
	match = {
		class = "com.github.wwmm.easyeffects",
	},
	workspace   = 10,
})

hl.window_rule({
	name        = "WebBrowser",

	match = {
		class = "zen",
	},
	workspace   = 3,
})

hl.window_rule({
	name        = "WebBrowser",

	match = {
		class = "brave-browser",
	},
	workspace   = 3,
})

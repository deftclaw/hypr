-- See https://wiki.hypr.land/Configuring/Monitors/


-- Automatic Addition of monitors --
hl.monitor({
	output   = "",
	mode     = "preferred",
	position = "auto",
	scale    = "auto",
})

-- Primary: Center, 4k --
hl.monitor({
	output   = "DP-4",
	mode     = "3840x2160@60.00Hz",
	position = "1200x0",
	scale    = "1",
})

-- Comm: Right, FHD, 90deg --
hl.monitor({
	output    = "DP-5",
	mode      = "1920x1200",
	position  = "5040x0",
	scale     = "1",
	transform = "1",
})

-- Page: Left, FHD, 90deg --
hl.monitor({
	output    = "DP-7",
	mode      = "1920x1200",
	position  = "0x0",
	scale     = "1",
	transform = "3",
})

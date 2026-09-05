/area/misc/testroom
	name = "Unit Test Room"
	icon_state = "test_room"
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	// Mobs should be able to see inside the testroom
	static_lighting = FALSE
	base_lighting_alpha = 255

// will be unused once kurper gets his login interface patch done
/area/misc/start
	name = "start area"
	icon_state = "start"
	requires_power = FALSE
	static_lighting = FALSE
	has_gravity = STANDARD_GRAVITY
	ambient_buzz = null

/area/planetoid
	name = "planetoid Planet Surface"
	icon_state = "planet"
	outdoors = TRUE
	always_unpowered = TRUE
	poweralm = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	has_gravity = STANDARD_GRAVITY
	sound_environment = SOUND_ENVIRONMENT_MOUNTAINS
	ambience_index = AMBIENCE_PLANETOID
	ambient_buzz = null

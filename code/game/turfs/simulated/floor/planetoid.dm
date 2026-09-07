// PLANETOID GROUND TURFS
// Port of /turf/open/gm (CM groundmap) adapted for the 1984 codebase.

// === PARENT ===
/turf/simulated/floor/planetoid
	name = "ground dirt"
	desc = "Поверхность планеты."
	icon = 'icons/turf/ground_map.dmi'
	icon_state = "desert"
	atmos_mode = ATMOS_MODE_EXPOSED_TO_ENVIRONMENT
	atmos_environment = ENVIRONMENT_PLANETOID
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_SAND
	/// Whether this turf has been dug up.
	var/dug = FALSE
	/// What is dropped when dug up.
	var/digResult = /obj/item/stack/ore/glass

/turf/simulated/floor/planetoid/ex_act(severity, target)
	return

/turf/simulated/floor/planetoid/fire_act(exposed_temperature, exposed_volume)
	return

/turf/simulated/floor/planetoid/make_plating(make_floor_tile, mob/user)
	return

/turf/simulated/floor/planetoid/remove_plating()
	return

/turf/simulated/floor/planetoid/crowbar_act(mob/user, obj/item/I)
	return

// === DIRT ===
/turf/simulated/floor/planetoid/dirt
	name = "dirt"
	icon_state = "desert"
	baseturf = /turf/simulated/floor/planetoid/dirt

/turf/simulated/floor/planetoid/dirt/Initialize(mapload)
	. = ..()
	if(rand(0, 15) == 0) // occasional texture variation
		icon_state = "desert[rand(0, 3)]"

/turf/simulated/floor/planetoid/dirt/desert0
	icon_state = "desert0"

/turf/simulated/floor/planetoid/dirt/desert1
	icon_state = "desert1"

/turf/simulated/floor/planetoid/dirt/desert2
	icon_state = "desert2"

/turf/simulated/floor/planetoid/dirt/desert3
	icon_state = "desert3"

/turf/simulated/floor/planetoid/dirt/desert_dug
	icon_state = "desert_dug"
	dug = TRUE

/turf/simulated/floor/planetoid/dirt/proc/can_dig(mob/user)
	if(!dug)
		return TRUE
	if(user)
		to_chat(user, span_notice("Похоже, здесь уже копали."))

/turf/simulated/floor/planetoid/dirt/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(ATTACK_CHAIN_CANCEL_CHECK(.))
		return .
	if(!(istype(I, /obj/item/shovel) || istype(I, /obj/item/pickaxe)))
		return .
	if(!can_dig(user))
		return .
	I.play_tool_sound()
	to_chat(user, span_notice("Вы начинаете копать..."))
	if(!do_after(user, 4 SECONDS * I.toolspeed, src, category = DA_CAT_TOOL) || !can_dig(user))
		return .
	I.play_tool_sound()
	to_chat(user, span_notice("Вы выкопали яму."))
	new digResult(src, 5)
	dug = TRUE
	icon_state = "desert_dug"
	return . | ATTACK_CHAIN_SUCCESS

// === DIRT (alt texture) ===
/turf/simulated/floor/planetoid/dirt2
	name = "dirt"
	icon_state = "dirt"
	baseturf = /turf/simulated/floor/planetoid/dirt2

// === GRASS ===
/turf/simulated/floor/planetoid/grass
	name = "grass"
	desc = "Трава."
	icon_state = "grass1"
	baseturf = /turf/simulated/floor/planetoid/grass
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GRASS

/turf/simulated/floor/planetoid/grass/grass1
	icon_state = "grass1"

/turf/simulated/floor/planetoid/grass/grass2
	icon_state = "grass2"

/turf/simulated/floor/planetoid/grass/grass3
	icon_state = "grass3"

/turf/simulated/floor/planetoid/grass/grass4
	icon_state = "grass4"

/turf/simulated/floor/planetoid/grass/grassbeach
	icon_state = "grassbeach"

/turf/simulated/floor/planetoid/grass/grassbeach/north
	dir = SOUTH

/turf/simulated/floor/planetoid/grass/grassbeach/south
	dir = NORTH

/turf/simulated/floor/planetoid/grass/grassbeach/west
	dir = EAST

/turf/simulated/floor/planetoid/grass/grassbeach/east
	dir = WEST

/turf/simulated/floor/planetoid/grass/gbcorner
	icon_state = "gbcorner"

/turf/simulated/floor/planetoid/grass/gbcorner/north_west
	dir = SOUTH

/turf/simulated/floor/planetoid/grass/gbcorner/south_east
	dir = NORTH

/turf/simulated/floor/planetoid/grass/gbcorner/south_west
	dir = EAST

/turf/simulated/floor/planetoid/grass/gbcorner/north_east
	dir = WEST

// === GRASS/DIRT BORDER ===
/turf/simulated/floor/planetoid/dirtgrassborder
	name = "grass"
	icon_state = "grassdirt_edge"
	baseturf = /turf/simulated/floor/planetoid/dirtgrassborder
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GRASS

/turf/simulated/floor/planetoid/dirtgrassborder/north
	dir = NORTH

/turf/simulated/floor/planetoid/dirtgrassborder/south
	dir = SOUTH

/turf/simulated/floor/planetoid/dirtgrassborder/west
	dir = EAST

/turf/simulated/floor/planetoid/dirtgrassborder/east
	dir = WEST

/turf/simulated/floor/planetoid/dirtgrassborder/grassdirt_corner
	icon_state = "grassdirt_corner"

/turf/simulated/floor/planetoid/dirtgrassborder/grassdirt_corner/north_west
	dir = SOUTH

/turf/simulated/floor/planetoid/dirtgrassborder/grassdirt_corner/north_east
	dir = NORTH

/turf/simulated/floor/planetoid/dirtgrassborder/grassdirt_corner/south_east
	dir = EAST

/turf/simulated/floor/planetoid/dirtgrassborder/grassdirt_corner/south_west
	dir = WEST

/turf/simulated/floor/planetoid/dirtgrassborder/grassdirt_corner2
	icon_state = "grassdirt_corner2"

/turf/simulated/floor/planetoid/dirtgrassborder/grassdirt_corner2/north_west
	dir = SOUTH

/turf/simulated/floor/planetoid/dirtgrassborder/grassdirt_corner2/north_east
	dir = EAST

/turf/simulated/floor/planetoid/dirtgrassborder/grassdirt_corner2/south_east
	dir = NORTH

/turf/simulated/floor/planetoid/dirtgrassborder/grassdirt_corner2/south_west
	dir = WEST

/turf/simulated/floor/planetoid/dirtgrassborder/desert
	icon_state = "desert"

/turf/simulated/floor/planetoid/dirtgrassborder/desert0
	icon_state = "desert0"

/turf/simulated/floor/planetoid/dirtgrassborder/desert1
	icon_state = "desert1"

/turf/simulated/floor/planetoid/dirtgrassborder/desert2
	icon_state = "desert2"

/turf/simulated/floor/planetoid/dirtgrassborder/desert3
	icon_state = "desert3"

/turf/simulated/floor/planetoid/dirtgrassborder/desert_dug
	icon_state = "desert_dug"
	dug = TRUE

// === GRASS/DIRT2 BORDER ===
/turf/simulated/floor/planetoid/dirtgrassborder2
	name = "grass"
	icon_state = "grassdirt2_edge"
	baseturf = /turf/simulated/floor/planetoid/dirtgrassborder2
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GRASS

/turf/simulated/floor/planetoid/dirtgrassborder2/north
	dir = NORTH

/turf/simulated/floor/planetoid/dirtgrassborder2/east
	dir = EAST

/turf/simulated/floor/planetoid/dirtgrassborder2/west
	dir = WEST

/turf/simulated/floor/planetoid/dirtgrassborder2/wall2
	icon_state = "wall2"

/turf/simulated/floor/planetoid/dirtgrassborder2/wall3
	icon_state = "wall3"
// === WATER / RIVER ===
/turf/simulated/floor/planetoid/water
	name = "river"
	desc = "Река."
	icon_state = "seashallow"
	baseturf = /turf/simulated/floor/planetoid/water
	slowdown = 1.75
	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER
	heat_capacity = 20000
	/// Which icon_state is layered over the base to render flowing water.
	var/icon_overlay = "riverwater"
	/// Whether the water overlay is drawn at all.
	var/no_overlay = FALSE

/turf/simulated/floor/planetoid/water/Initialize(mapload)
	. = ..()
	update_overlays()

/turf/simulated/floor/planetoid/water/update_overlays()
	overlays.Cut()
	if(no_overlay)
		return
	overlays += image(icon = icon, icon_state = icon_overlay, layer = ABOVE_MOB_LAYER, dir = dir)

/turf/simulated/floor/planetoid/water/Entered(atom/movable/arrived, atom/old_loc)
	. = ..()
	// Being in the river washes off blood and grime.
	if(isliving(arrived))
		arrived.wash_tg(CLEAN_WASH)

/turf/simulated/floor/planetoid/water/poison
	name = "poisoned river"
	desc = "Ядовитая река. Лучше держаться подальше."

/turf/simulated/floor/planetoid/water/poison/Entered(atom/movable/arrived, atom/old_loc)
	. = ..()
	if(isliving(arrived))
		var/mob/living/living = arrived
		living.apply_damage(25, TOX)

/turf/simulated/floor/planetoid/water/ocean
	name = "shallow ocean"
	desc = "Мелкий океан."
	color = "#dae3e2"
	slowdown = 4

/turf/simulated/floor/planetoid/water/ocean/deep
	name = "deep ocean"
	desc = "Глубокий океан. Плыть тяжело."

/turf/simulated/floor/planetoid/water/pool
	name = "pool"

/turf/simulated/floor/planetoid/water/pool/no_overlay
	no_overlay = TRUE

/turf/simulated/floor/planetoid/water/no_overlay
	no_overlay = TRUE

// === COASTLINE ===
/turf/simulated/floor/planetoid/coast
	name = "coastline"
	desc = "Линия берега."
	icon_state = "beach"
	baseturf = /turf/simulated/floor/planetoid/coast
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_SAND

/turf/simulated/floor/planetoid/coast/north
	dir = SOUTH

/turf/simulated/floor/planetoid/coast/south
	dir = NORTH

/turf/simulated/floor/planetoid/coast/west
	dir = EAST

/turf/simulated/floor/planetoid/coast/east
	dir = WEST

/turf/simulated/floor/planetoid/coast/south_east
	dir = 9

/turf/simulated/floor/planetoid/coast/beachcorner
	icon_state = "beachcorner"

/turf/simulated/floor/planetoid/coast/beachcorner/north_west
	dir = SOUTH

/turf/simulated/floor/planetoid/coast/beachcorner/north_east
	dir = NORTH

/turf/simulated/floor/planetoid/coast/beachcorner/south_east
	dir = EAST

/turf/simulated/floor/planetoid/coast/beachcorner/south_west
	dir = WEST

/turf/simulated/floor/planetoid/coast/beachcorner2
	icon_state = "beachcorner2"

/turf/simulated/floor/planetoid/coast/beachcorner2/east
	dir = EAST

/turf/simulated/floor/planetoid/coast/beachcorner2/north_west
	dir = SOUTH

/turf/simulated/floor/planetoid/coast/beachcorner2/north_east
	dir = NORTH

/turf/simulated/floor/planetoid/coast/beachcorner2/south_west
	dir = EAST

/turf/simulated/floor/planetoid/coast/beachcorner2/south_east
	dir = WEST

// === DEEP WATER (riverdeep analog) ===
/turf/simulated/floor/planetoid/water/deep
	name = "deep water"
	desc = "Глубокая вода."
	icon_state = "seadeep"
	slowdown = 2.5

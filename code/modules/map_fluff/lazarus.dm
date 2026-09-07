/datum/map/lazarus
	name = "lazarus"
	map_path = "_maps/map_files/lazarus/lazarus.dmm"
	linkage = SELFLOOPING

	station_name = "NSS lazarus"
	english_station_name = "NSS lazarus"
	station_short = "lazarus"
	dock_name = "ASV lazarus"
	company_name = "1984"
	company_short = "1984"
	starsys_name = "Unknown System"

	admin_only = TRUE
	disables = DISABLE_ALL

	traits = list(
		list(MAIN_STATION, STATION_LEVEL = "Station", ZTRAIT_RAIN, ZTRAIT_BASETURF = /turf/simulated/floor/planetoid/dirt),
	)

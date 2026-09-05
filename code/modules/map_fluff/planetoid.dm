/datum/map/planetoid
	name = "planetoid"
	map_path = "_maps/map_files/planetoid/planetoid.dmm"
	linkage = SELFLOOPING

	station_name = "NSS Planetoid"
	english_station_name = "NSS Planetoid"
	station_short = "Planetoid"
	dock_name = "ASV Planetoid"
	company_name = "1984"
	company_short = "1984"
	starsys_name = "Unknown System"

	admin_only = TRUE
	disables = DISABLE_ALL

	traits = list(
		list(MAIN_STATION, STATION_LEVEL = "Station", ZTRAIT_RAIN, ZTRAIT_BASETURF = /turf/simulated/floor/planetoid/dirt),
	)

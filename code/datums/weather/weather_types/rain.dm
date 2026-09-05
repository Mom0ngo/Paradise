/datum/weather/rain
	name = "rain"
	desc = "Мягкий дождь омывает поверхность планеты, создавая умиротворяющую атмосферу."

	telegraph_message = span_notice_alt("Небо темнеет, первые капли дождя начинают падать...")
	telegraph_overlay = "light_rain"

	weather_message = span_notice_alt("<i>Дождь льёт как из ведра. Приятное журчание воды наполняет воздух.</i>")
	weather_overlay = "rain"
	weather_duration_lower = 60 SECONDS
	weather_duration_upper = 180 SECONDS

	end_message = span_notice_alt("Дождь заканчивается. Последние капли падают на землю.")
	end_overlay = "light_rain"

	area_type = /area/planetoid
	target_trait = ZTRAIT_RAIN

	probability = 50

	barometer_predictable = TRUE

	var/list/weak_sounds = list()
	var/list/strong_sounds = list()
	var/wetness_counter = 0
	var/soak_interval = 10

/datum/weather/rain/proc/update_eligible_areas()
	var/list/eligible_areas = list()
	for(var/z in impacted_z_levels)
		eligible_areas += SSmapping.areas_in_z["[z]"]

	for(var/i in 1 to length(eligible_areas))
		var/area/place = eligible_areas[i]
		if(is_area_shuttle(place))
			continue
		if(place.outdoors)
			weak_sounds[place] = /datum/looping_sound/weak_outside_rain
			strong_sounds[place] = /datum/looping_sound/active_outside_rain
		else
			weak_sounds[place] = /datum/looping_sound/weak_inside_rain
			strong_sounds[place] = /datum/looping_sound/active_inside_rain

/datum/weather/rain/proc/update_audio(next_stage)
	switch(next_stage)
		if(STARTUP_STAGE)
			GLOB.rain_sounds += weak_sounds

		if(MAIN_STAGE)
			GLOB.rain_sounds -= weak_sounds
			GLOB.rain_sounds += strong_sounds

		if(WIND_DOWN_STAGE)
			GLOB.rain_sounds -= strong_sounds
			GLOB.rain_sounds += weak_sounds

		if(END_STAGE)
			GLOB.rain_sounds -= weak_sounds

/datum/weather/rain/telegraph()
	. = ..()
	if(.)
		update_eligible_areas()
		update_audio(STARTUP_STAGE)

/datum/weather/rain/start()
	update_audio(MAIN_STAGE)
	. = ..()

/datum/weather/rain/wind_down()
	update_audio(WIND_DOWN_STAGE)
	. = ..()

/datum/weather/rain/end()
	update_audio(END_STAGE)
	. = ..()

/datum/weather/rain/fire()
	wetness_counter++

/datum/weather/rain/weather_act(mob/living/target)
	if(!iscarbon(target) || (wetness_counter % soak_interval))
		return

	var/mob/living/carbon/carbon_target = target
	carbon_target.water_act(15, T20C, src)

/datum/weather/rain/drizzle
	name = "drizzle"
	desc = "Проходящий дождь задевает планету краем, оставляя лишь лёгкую морось."

	weather_message = span_notice_alt("<i>Морось тихо шепчет по крышам. Похоже, дождь обошёл вас стороной...</i>")
	weather_overlay = "light_rain"

	end_message = span_notice_alt("Морось прекращается. Небо снова проясняется.")
	end_overlay = "light_rain"

	aesthetic = TRUE

	probability = 10

/datum/weather/rain/drizzle/update_audio(next_stage)
	switch(next_stage)
		if(STARTUP_STAGE, WIND_DOWN_STAGE)
			GLOB.rain_sounds += weak_sounds

		if(MAIN_STAGE)
			GLOB.rain_sounds -= strong_sounds
			GLOB.rain_sounds += weak_sounds

		if(END_STAGE)

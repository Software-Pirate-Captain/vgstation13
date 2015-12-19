/* Diffrent misc types of tiles
 * Contains:
 *		Grass
 *		Wood
 *		Carpet
 */

/obj/item/stack/tile
	var/material

/obj/item/stack/tile/ex_act(severity)
	switch(severity)
		if(1.0)
			returnToPool(src)
			return
		if(2.0)
			if (prob(50))
				returnToPool(src)
				return
		if(3.0)
			if (prob(5))
				returnToPool(src)
				return
		else
	return

/obj/item/stack/tile/blob_act()
	returnToPool(src)

/obj/item/stack/tile/singularity_act()
	returnToPool(src)
	return 2

/*
 * Grass
 */
/obj/item/stack/tile/grass
	name = "grass tile"
	singular_name = "grass floor tile"
	desc = "A patch of grass like they often use on golf courses"
	icon_state = "tile_grass"
	w_class = 3.0
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	flags = FPRINT
	siemens_coefficient = 1
	max_amount = 60
	origin_tech = "biotech=1"

	material = "grass"

/*
 * Wood
 */
/obj/item/stack/tile/wood
	name = "wood floor tile"
	singular_name = "wood floor tile"
	desc = "an easy to fit wood floor tile"
	icon_state = "tile-wood"
	w_class = 3.0
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	flags = FPRINT
	siemens_coefficient = 1
	max_amount = 60

	material = "wood"

/obj/item/stack/tile/wood/proc/build(turf/S as turf)
	if(istype(S,/turf/unsimulated))
		S.ChangeTurf(/turf/simulated/floor/plating/deck/airless)
	else
		S.ChangeTurf(/turf/simulated/floor/plating/deck)

/obj/item/stack/tile/wood/afterattack(atom/target, mob/user, adjacent, params)
	if(adjacent)
		if(isturf(target) || istype(target, /obj/structure/lattice))
			var/turf/T = get_turf(target)
			var/obj/structure/lattice/L
			var/obj/item/stack/tile/wood/S = src
			switch(T.canBuildPlating(S))
				if(BUILD_SUCCESS)
					L = locate(/obj/structure/lattice) in T
					if(!istype(L))
						return
					qdel(L)
					playsound(get_turf(src), 'sound/weapons/Genhit.ogg', 50, 1)
					S.build(T)
					S.use(1)
					return
				if(BUILD_IGNORE)
					playsound(get_turf(src), 'sound/weapons/Genhit.ogg', 50, 1)
					S.build(T)
					S.use(1)
				if(BUILD_FAILURE)
					to_chat(user, "<span class='warning'>You can't get that deck up without some support!</span>")
					return

/*
 * Carpets
 */
/obj/item/stack/tile/carpet
	name = "length of carpet"
	singular_name = "length of carpet"
	desc = "A piece of carpet. It is the same size as a floor tile"
	icon_state = "tile-carpet"
	w_class = 3.0
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	flags = FPRINT
	siemens_coefficient = 1
	max_amount = 60

	material = "fabric"

/obj/item/stack/tile/arcade
	name = "length of arcade carpet"
	singular_name = "length of arcade carpet"
	desc = "A piece of arcade carpet. It has a snazzy space theme."
	icon_state = "tile-arcade"
	w_class = 3.0
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	flags = FPRINT
	siemens_coefficient = 1
	max_amount = 60

	material = "fabric"
// The unfortunate defines.
#define BLOOD_STATE_SEMEN				"semen"
#define BLOOD_STATE_SEFEM				"femcum"
#define SEMEN_AMOUNT_PER_DECAL			20

//body bluids
/datum/reagent/consumable/semen
	name = "Semen"
	description = "Sperm from some animal. Useless for anything but insemination, really."
	taste_description = "something salty"
	taste_mult = 2 //Not very overpowering flavor
	data = list("donor"=null,"viruses"=null,"donor_DNA"=null,"blood_type"=null,"resistances"=null,"trace_chem"=null,"mind"=null,"ckey"=null,"gender"=null,"real_name"=null)
	reagent_state = LIQUID
	color = "#FFFFFF" // rgb: 255, 255, 255
	can_synth = FALSE
	nutriment_factor = 0.5 * REAGENTS_METABOLISM
	glass_icon_state = "nothing"
	glass_desc = "In the Sumerian mythology, Enki - the God of water, was believed to have created the Tigris and Euphrates rivers by masturbating and ejaculating into their empty riverbeds."

/datum/reagent/consumable/semen/reaction_turf(turf/T, reac_volume)
	if(!istype(T))
		return
	if(reac_volume < 3)
		return

	var/obj/effect/decal/cleanable/semen/S = locate() in T
	if(!S)
		S = new(T)
	if(data["blood_DNA"])
		S.add_blood_DNA(list(data["blood_DNA"] = data["blood_type"]))

/obj/effect/decal/cleanable/semen
	name = "semen"
	desc = null
	gender = PLURAL
	density = 0
	layer = ABOVE_NORMAL_TURF_LAYER
	icon = 'icons/obj/genitals/effects.dmi'
	icon_state = "semen1"
	random_icon_states = list("semen1", "semen2", "semen3", "semen4")
	blood_state = BLOOD_STATE_SEMEN
	bloodiness = SEMEN_AMOUNT_PER_DECAL

/obj/effect/decal/cleanable/semen/New()
	..()
	dir = pick(1,2,4,8)
	add_blood_DNA(list("Non-human DNA" = "A+"))

/obj/effect/decal/cleanable/semen/replace_decal(obj/effect/decal/cleanable/semen/S)
	if(S.blood_DNA)
		blood_DNA |= S.blood_DNA
	return ..()

/datum/reagent/consumable/femcum
	name = "Female Ejaculate"
	description = "Vaginal lubricant found in most mammals and other animals of similar nature. Where you found this is your own business."
	taste_description = "something with a tang" // wew coders who haven't eaten out a girl.
	taste_mult = 2
	data = list("donor"=null,"viruses"=null,"donor_DNA"=null,"blood_type"=null,"resistances"=null,"trace_chem"=null,"mind"=null,"ckey"=null,"gender"=null,"real_name"=null)
	reagent_state = LIQUID
	color = "#AAAAAA77"
	can_synth = FALSE
	nutriment_factor = 0.5 * REAGENTS_METABOLISM
	glass_icon_state = "nothing"

/obj/effect/decal/cleanable/femcum
	name = "female ejaculate"
	desc = null
	gender = PLURAL
	density = 0
	layer = ABOVE_NORMAL_TURF_LAYER
	icon = 'icons/obj/genitals/effects.dmi'
	icon_state = "fem1"
	random_icon_states = list("fem1", "fem2", "fem3", "fem4")
	blood_state = null
	bloodiness = null
//	blood_state = BLOOD_STATE_SEFEM
//	bloodiness = SEMEN_AMOUNT_PER_DECAL

/obj/effect/decal/cleanable/femcum/New()
	..()
	dir = pick(1,2,4,8)
	add_blood_DNA(list("Non-human DNA" = "A+"))

/obj/effect/decal/cleanable/femcum/replace_decal(obj/effect/decal/cleanable/femcum/S)
	if(S.blood_DNA)
		blood_DNA |= S.blood_DNA
	return ..()

/datum/reagent/consumable/femcum/reaction_turf(turf/T, reac_volume)
	if(!istype(T))
		return
	if(reac_volume < 3)
		return

	var/obj/effect/decal/cleanable/femcum/S = locate() in T
	if(!S)
		S = new(T)
	if(data["blood_DNA"])
		S.add_blood_DNA(list(data["blood_DNA"] = data["blood_type"]))

/datum/reagent/consumable/milk/reaction_turf(turf/T, reac_volume)
	if(!istype(T))
		return
	if(reac_volume < 3)
		return

	var/obj/effect/decal/cleanable/milk/S = locate() in T
	if(!S)
		S = new(T)
	if(data["blood_DNA"])
		S.add_blood_DNA(list(data["blood_DNA"] = data["blood_type"]))

/obj/effect/decal/cleanable/milk
	name = "milk"
	desc = null
	gender = PLURAL
	density = 0
	layer = ABOVE_NORMAL_TURF_LAYER
	icon = 'icons/obj/genitals/effects.dmi'
	icon_state = "milk1"
	random_icon_states = list("milk1", "milk2", "milk3", "milk4")

/obj/effect/decal/cleanable/milk/New()
	..()
	dir = pick(1,2,4,8)
	add_blood_DNA(list("Non-human DNA" = "A+"))

/obj/effect/decal/cleanable/milk/replace_decal(obj/effect/decal/cleanable/milk/S)
	if(S.blood_DNA)
		blood_DNA |= S.blood_DNA
	return ..()

/datum/species/ipc
	name = "I.P.C."
	id = "ipc"
	limbs_id = "ipc"
	icon_limbs = "ipc"
	say_mod = "beeps"
	default_color = "00FF00"
	blacklisted = 0
	sexes = 0
	species_traits = list(MUTCOLORS,NOEYES,NOTRANSSTING,HAIR,ROBOTIC_LIMBS)

	inherent_traits = list(TRAIT_RADIMMUNE, TRAIT_VIRUSIMMUNE, TRAIT_NOBREATH, TRAIT_NOHARDCRIT,
	TRAIT_NOSOFTCRIT, TRAIT_EASYDISMEMBER, TRAIT_EASYLIMBDISABLE, TRAIT_LIMBATTACHMENT,
	TRAIT_FAKEDEATH, TRAIT_NOHUNGER, TRAIT_NOTHIRST, TRAIT_NOPAIN, TRAIT_RESISTLOWPRESSURE, TRAIT_NOBREATH, TRAIT_AUXILIARY_LUNGS)

	hair_alpha = 210
	inherent_biotypes = MOB_ROBOTIC|MOB_HUMANOID
	mutant_bodyparts = list("ipc_screen" = "Blank", "ipc_antenna" = "None")
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/human/mutant/ipc
	gib_types = list(/obj/effect/gibspawner/ipc, /obj/effect/gibspawner/ipc/bodypartless)

	coldmod = 0.5
	heatmod = 1.2
	cold_offset = -125

	//Just robo looking parts.
	mutant_heart = /obj/item/organ/heart/ipc
	mutantlungs = /obj/item/organ/lungs/ipc
	mutantliver = /obj/item/organ/liver/ipc
	mutantstomach = /obj/item/organ/stomach/ipc
	mutanteyes = /obj/item/organ/eyes/ipc
	mutantears = /obj/item/organ/ears/ipc
	mutanttongue = /obj/item/organ/tongue/robot/ipc
	mutant_brain = /obj/item/organ/brain/ipc

	//special cybernetic organ for getting power from apcs
	mutant_organs = list(/obj/item/organ/cyberimp/arm/power_cord)

	exotic_bloodtype = "S"
	exotic_blood_color = BLOOD_COLOR_OIL
	species_type = "robotic"

	var/datum/action/innate/monitor_change/screen

/datum/species/ipc/on_species_gain(mob/living/carbon/human/C)
	if(isipcperson(C) && !screen)
		screen = new
		screen.Grant(C)
	..()

/datum/species/ipc/Destroy(force, ...)
	QDEL_NULL(screen)
	return ..()

/datum/species/ipc/on_species_loss(mob/living/carbon/human/C)
	QDEL_NULL(screen)
	..()

/datum/action/innate/monitor_change
	name = "Screen Change"
	check_flags = AB_CHECK_CONSCIOUS
	icon_icon = 'icons/mob/actions/actions_silicon.dmi'
	button_icon_state = "drone_vision"

/datum/action/innate/monitor_change/Activate()
	var/mob/living/carbon/human/H = owner
	var/new_ipc_screen = input(usr, "Choose your character's screen:", "Monitor Display") as null|anything in GLOB.ipc_screens_list
	if(!new_ipc_screen)
		return
	H.dna.features["ipc_screen"] = new_ipc_screen
	H.update_body()

/datum/species/ipc/spec_life(mob/living/carbon/human/H)
	if(H.nutrition < NUTRITION_LEVEL_FED)
		H.nutrition = NUTRITION_LEVEL_FED
	if(H.nutrition > NUTRITION_LEVEL_FED)
		H.nutrition = NUTRITION_LEVEL_FED
	if(H.water < THIRST_LEVEL_FULL)
		H.water = THIRST_LEVEL_FULL
	if(H.water > THIRST_LEVEL_FULL)
		H.water = THIRST_LEVEL_FULL


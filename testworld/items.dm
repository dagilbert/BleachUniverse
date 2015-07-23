
// File:    demo\items.dm
// Library: Forum_account.ActionRpgFramework
// Author:  Forum_account
//
// Contents:
//   This file defines items and shows how to:
//    * create items that give stat bonuses
//    * create items that can be used and consumed
//    * create stackable items
//    * create equippable items

// we define the equipment slots we'll have
var
	const
		MAIN_HAND = "main-hand"
		BODY = "body"
		HEAD = "head"
		RELEASE = "body"

item
	icon = 'items.dmi'
	overlay_icon = 'moboverlay.dmi'
	map_icon = 'items.dmi'

	iron_bar
		name = "Iron Bar"
		icon_state = "iron-bar"
		map_state = "iron-bar-map"

		stack_size = 20
		count = 5
		description = "Used for crafting\nThis\nis\na long\ndescription"

	sword
		name = "Sword"
		icon_state = "sword"
		description = "+5 Power"
		overlay_state = "sword"
		overlay_layer = 2
		map_state = "sword-map"

		slot = MAIN_HAND

		// make the sword actually give you +5 effectivepower
		equipped(mob/m)
			m.overlay(src)
			m.effectivepower += 5

		unequipped(mob/m)
			m.remove(src)
			m.effectivepower -= 5

	zangetsu
		name = "Zangetsu"
		icon_state = "zangetsu"
		description = "Ichigo Kurosaki's Shikai"
		overlay_state = "zangetsu"
		overlay_layer = 2
		map_state = "zangetsu-map"

		slot = RELEASE

		equipped(mob/m)
			m.overlay(src)
			m.boostedpower = m.effectivepower*5

		unequipped(mob/m)
			m.remove(src)
			m.boostedpower = 0

	dagger
		name = "Dagger"
		icon_state = "dagger"
		description = "+3 Power, +5 effectivespeed"
		map_state = "dagger-map"

		slot = MAIN_HAND

		equipped(mob/m)
			m.effectivepower += 3
			m.effectivespeed += 5

		unequipped(mob/m)
			m.effectivepower -= 3
			m.effectivespeed -= 5

	helmet
		name = "Helmet"
		icon_state = "helmet"
		description = "+2 Defense"
		overlay_state = "helmet"
		map_state = "helmet-map"

		slot = HEAD
		cost = 5

		// make the helmet actually give you +2 effectivedefense
		equipped(mob/m)
			m.overlay(src)
			m.effectivedefense += 2

		unequipped(mob/m)
			m.remove(src)
			m.effectivedefense -= 2

	hollowmask1
		name = "Vaizard Mask"
		icon_state = "mask1"
		description = "+lots Power Put this on and go crazy!"
		overlay_state = "mask1"
		map_state = "mask1-map"

		slot = HEAD
		cost = 500

		//Makes your stats go skoogly woogly
		equipped(mob/m)
			m.overlay(src)

		unequipped(mob/m)
			m.remove(src)

	armor
		name = "Armor"
		icon_state = "armor"
		description = "+4 Defense"
		overlay_state = "armor"
		map_state = "armor-map"

		slot = BODY
		cost = 8

		// make the armor actually give you +4 effectivedefense
		equipped(mob/m)
			m.overlay(src)
			m.effectivedefense += 4

		unequipped(mob/m)
			m.remove(src)
			m.effectivedefense -= 4

	shinigarb
		name = "Shinigami Robe"
		icon_state = "shinirobe"
		description = "Worn by shinigami"
		overlay_state = "shinirobe"
		map_state = "shinirobe-map"

		slot = BODY
		cost = 8

		equipped(mob/m)
			m.overlay(src)

		unequipped(mob/m)
			m.remove(src)

	health_potion
		name = "Health Potion"
		icon_state = "health-potion"
		description = "Restores 15 health"
		map_state = "health-potion-map"

		count = 1
		stack_size = 5
		cost = 3

		use(mob/m)
			m.gain_health(15)

			// consume one potion
			consume(1)

mob
	// we play this sound effect when a player loots or buys an item
	got_item()
		..()
		sound_effect('boop.wav')

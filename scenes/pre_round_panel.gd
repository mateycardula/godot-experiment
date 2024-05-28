extends GridContainer

@export var dmg_upgrade_btn : Button
@export var fire_rate_upgrade_btn : Button
@export var publish_signal : SignalPublisher

var gold : int:
	set(amount):
		gold = amount
		update_button_colors(dmg_upgrade, dmg_upgrade_btn)
		update_button_colors(fire_rate_upgrade, fire_rate_upgrade_btn)

var dmg_upgrade : Upgrade : 
	set(upgrade):
		dmg_upgrade = upgrade
		update_button_colors(dmg_upgrade, dmg_upgrade_btn)
		dmg_upgrade_btn.draw_upgrade(dmg_upgrade)

var fire_rate_upgrade : Upgrade : 
	set(upgrade):
		fire_rate_upgrade = upgrade
		update_button_colors(fire_rate_upgrade, fire_rate_upgrade_btn)
		fire_rate_upgrade_btn.draw_upgrade(fire_rate_upgrade)

func set_gold(amount):
	gold = amount

func get_current_upgrade(array : Array[Upgrade]) -> Upgrade:
	var found_not_unlocked_upgrade = false
	for upgrade in array:
		if(not upgrade.unlocked):
			found_not_unlocked_upgrade = true
			return upgrade
	return array.back()
	pass


func _on_dmg_upgrade_pressed():
	publish_signal.all_signals.UPGRADE_GUN.emit(UpgradeEnums.type.DAMAGE)

func _on_fire_rate_upgrade_pressed():
	publish_signal.all_signals.UPGRADE_GUN.emit(UpgradeEnums.type.FIRE_RATE)


func update_button_colors(upgrade : Upgrade,btn : Button):
	if(upgrade == null):
		btn.self_modulate = Color.WHITE
	else:
		if(gold<upgrade.cost):
				btn.self_modulate = Color.RED
				btn.disabled = true
		else:
			btn.self_modulate = Color.GREEN
			btn.disabled = false

func set_current_upgrade(upgrade):
	dmg_upgrade = upgrade

func set_current_fire_rate_upgrade(upgrade):
	print("HERE HERE")
	fire_rate_upgrade = upgrade

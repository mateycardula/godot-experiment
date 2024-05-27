extends GridContainer

@export var dmg_upgrade_btn : Button
@export var fire_rate_upgrade_btn : Button
@export var publish_signal : SignalPublisher

var gold : int:
	set(amount):
		gold = amount
		update_button_colors(current_dmg_upgrade, dmg_upgrade_btn)
		update_button_colors(current_fire_rate_upgrade, fire_rate_upgrade_btn)


var dmg_upgrades : Array[Upgrade] :
	set(array):
		dmg_upgrades = array
		current_dmg_upgrade = get_current_upgrade(dmg_upgrades)
		update_button_colors(current_dmg_upgrade, dmg_upgrade_btn)
		if (current_dmg_upgrade.unlocked):
			dmg_upgrade_btn.maxed_out = true
		dmg_upgrade_btn.draw_upgrade(current_dmg_upgrade)
		
var fire_rate_upgrades : Array[Upgrade] :
	set(array):
		fire_rate_upgrades = array
		current_fire_rate_upgrade = get_current_upgrade(fire_rate_upgrades)
		if(current_fire_rate_upgrade.unlocked):
			fire_rate_upgrade_btn.maxed_out = true
		update_button_colors(current_fire_rate_upgrade, fire_rate_upgrade_btn)
		fire_rate_upgrade_btn.draw_upgrade(current_fire_rate_upgrade)

var current_dmg_upgrade : Upgrade
var current_fire_rate_upgrade : Upgrade = Upgrade.new()

func set_damage_upgrades(array):
	dmg_upgrades = array
	pass

func set_fire_rate_upgrades(array):
	fire_rate_upgrades = array
	pass

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
	for upgrade in dmg_upgrades:
		if current_dmg_upgrade == upgrade:
			upgrade = current_dmg_upgrade
			upgrade.unlocked = true
			publish_signal.all_signals.SPEND_GOLD.emit(current_dmg_upgrade.cost)
			publish_signal.all_signals.UPGRADE_GUN_DAMAGE.emit(current_dmg_upgrade.d_value)
			publish_signal.all_signals.GUN_DAMAGE_LIST_CALLBACK.emit(dmg_upgrades)
			return	

func _on_fire_rate_upgrade_pressed():
	for upgrade in fire_rate_upgrades:
		if current_fire_rate_upgrade == upgrade:
			upgrade = current_fire_rate_upgrade
			upgrade.unlocked = true
			publish_signal.all_signals.SPEND_GOLD.emit(current_fire_rate_upgrade.cost)
			publish_signal.all_signals.UPGRADE_FIRE_RATE.emit(current_fire_rate_upgrade.d_value)
			publish_signal.all_signals.GUN_FIRE_RATE_LIST_CALLBACK.emit(fire_rate_upgrades)
			return	
	pass


func update_button_colors(upgrade : Upgrade,btn : Button):
	if(upgrade.unlocked):
		btn.self_modulate = Color.WHITE
	else:
		if(gold<upgrade.cost):
				btn.self_modulate = Color.RED
				btn.disabled = true
		else:
			btn.self_modulate = Color.GREEN
			btn.disabled = false


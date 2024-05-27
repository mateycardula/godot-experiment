extends SignalListener

func _ready():
	subscribe(update_fire_rate_status, 
	all_signals.TICK)
	
	subscribe(update_gun_dmg_upgrade_list,
	all_signals.GUN_DAMAGE_LIST_CALLBACK)
	
	subscribe(upgrade_damage, 
	all_signals.UPGRADE_GUN_DAMAGE)
	
	subscribe(upgrade_fire_rate, 
	all_signals.UPGRADE_FIRE_RATE)

	subscribe(update_gun_fire_rate_upgrade_list,
	all_signals.GUN_FIRE_RATE_LIST_CALLBACK)
	pass

func update_fire_rate_status(ticks : float):
	parent.update_fire_rate()
	pass

func update_gun_dmg_upgrade_list(array : Array[Upgrade]):
	parent.set_damage_upgrades(array)

func update_gun_fire_rate_upgrade_list(array : Array[Upgrade]):
	parent.set_fire_rate_upgrades(array)

func upgrade_damage(d_damage : int):
	parent.upgrade_damage(d_damage)
	pass

func upgrade_fire_rate(d_fire_rate : int):
	parent.upgrade_fire_rate(d_fire_rate)

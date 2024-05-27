extends SignalListener

func _ready():
	subscribe(dmg_upgrades_update,
	all_signals.GUN_DAMAGE_UPGRADE_LIST_UPDATE)	
	
	subscribe(fire_rate_upgrades_update,
	all_signals.GUN_FIRE_RATE_UPGRADE_LIST_UPDATE)
	
	subscribe(gold_update,
	all_signals.GOLD_UPDATE)


func dmg_upgrades_update(upgrades : Array[Upgrade]):
	parent.set_damage_upgrades(upgrades)
	pass

func fire_rate_upgrades_update(upgrades : Array[Upgrade]):
	parent.set_fire_rate_upgrades(upgrades)
	pass

func gold_update(gold : int):
	parent.set_gold(gold)
	pass

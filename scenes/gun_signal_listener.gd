extends SignalListener

func _ready():
	subscribe(update_fire_rate_status, 
	all_signals.TICK)
	
	subscribe(upgrade_gun,
	all_signals.UPGRADE_GUN)

func update_fire_rate_status(ticks : float):
	parent.update_fire_rate()
	pass
	
func upgrade_gun(upgrade_type : UpgradeEnums.type):
	parent.upgrade(upgrade_type)
	pass

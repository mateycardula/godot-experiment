extends SignalListener

func _ready():
	
	subscribe(gold_update,
	all_signals.GOLD_UPDATE)
	
	subscribe(set_current_upgrade,
	all_signals.CURRENT_DAMAGE_UPGRADE)
	
	subscribe(set_current_fire_rate_upgrade,
	all_signals.CURRENT_FIRE_RATE_UPGRADE)


func gold_update(gold : int):
	parent.set_gold(gold)
	pass

func set_current_upgrade(upgrade):
	parent.set_current_upgrade(upgrade)
	pass

func set_current_fire_rate_upgrade(upgrade):
	parent.set_current_fire_rate_upgrade(upgrade)
	pass

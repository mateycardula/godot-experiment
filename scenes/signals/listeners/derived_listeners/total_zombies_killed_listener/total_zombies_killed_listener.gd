class_name UiTotalZombiesKilledListener extends SignalListener

func _ready():
	subscribe(total_zombies_killed_changed, 
	all_signals.TOTAL_ZOMBIES_KILLED_CHANGE)

func total_zombies_killed_changed(total):
	if(parent.has_method("total_zombies_killed_changed")):
		parent.total_zombies_killed_changed(total)
	pass

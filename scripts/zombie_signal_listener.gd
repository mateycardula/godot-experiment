class_name RoundSignalListener extends SignalListener

func _ready():
	subscribe(_zombie_killed, 
	all_signals.ZOMBIE_KILLED_SIGNAL)


func _zombie_killed():
	if parent.has_method("zombie_killed"):
		parent.zombie_killed()
	pass


class_name RoundSignalListener extends SignalListener

func _ready():
	subscribe(_zombie_killed, 
	all_signals.ZOMBIE_KILLED_SIGNAL)
	subscribe(tick_test, all_signals.TICK)


func _zombie_killed():
	if parent.has_method("zombie_killed"):
		parent.zombie_killed()
	pass

func tick_test(wait_time):
	print("TICK: ", wait_time)

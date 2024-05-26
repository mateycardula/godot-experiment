class_name ZombieSignalListener extends SignalMiddleware

var zombie_signal_controller : SignalDataHolder
var parent

func _ready():
	parent = get_parent()
	zombie_signal_controller = find_signal_controller(self, "SignalDataHolder")
	subscribe(_zombie_killed, zombie_signal_controller.zombie_killed_signal)


func _zombie_killed():
	if parent.has_method("zombie_killed"):
		parent.zombie_killed()
	pass


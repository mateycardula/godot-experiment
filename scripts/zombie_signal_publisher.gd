class_name ZombieSignalPublisher extends SignalMiddleware

var zombie_signal_controller : SignalDataHolder
var parent

func _ready():
	parent = get_parent
	zombie_signal_controller = find_signal_controller(self, "SignalDataHolder")

func publish_zombie_killed():
	zombie_signal_controller.zombie_killed_signal.emit()
	pass



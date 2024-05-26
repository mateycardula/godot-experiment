class_name UiSignalPublisher extends SignalMiddleware

var ui_signal_controller : SignalDataHolder
var parent

func _ready():
	parent = get_parent()
	ui_signal_controller = find_signal_controller(self, "SignalDataHolder")
	
func update_total_zombies_killed(total):
	print("KILL PUBLISH ", total)
	ui_signal_controller.total_zombies_killed_change.emit(total)

class_name UiTotalZombiesKilledListener extends UiSignalListener

func _ready():
	print(parent.name)
	subscribe(total_zombies_killed_changed, ui_signal_controller.total_zombies_killed_change)

func total_zombies_killed_changed(total):
	if(parent.has_method("total_zombies_killed_changed")):
		parent.total_zombies_killed_changed(total)
	pass

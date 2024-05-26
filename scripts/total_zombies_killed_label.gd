extends Label

func _ready():
	pass

func total_zombies_killed_changed(total):
	text = "Zombies killed %d " % [total]

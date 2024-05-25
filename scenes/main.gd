extends Node2D

var zombie_spawner
# Called when the node enters the scene tree for the first time.
func _ready():
	zombie_spawner = get_node("ZombieSpawner")
	zombie_spawner.test_signal.connect(print_success)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func print_success():
	print("Success")
	pass



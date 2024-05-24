extends Node2D

@export var zombie_scene : PackedScene
@export var spawning_lines : Array[SpawningData] = []
@export var zombie_data : Array[ZombieData] = []

var differing_zombies
var max_zombies
var spawned_zombies

var round_controller

signal test_signal

func _ready(): 
	spawned_zombies = 0
	round_controller = get_node("../RoundController")	
	round_controller.next_round.connect(new_round_setup)
	
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	pass

func _on_timer_timeout():
	test_signal.emit()
	if(spawned_zombies<max_zombies):
		spawn_zombie()
	pass # Replace with function body.

func spawn_zombie(): 
	
	var spawn_line = spawning_lines[randi_range(0, spawning_lines.size() - 1)]
	var new_zombie = zombie_scene.instantiate()
	new_zombie.zombie_data = zombie_data[randi_range(0, differing_zombies)]
	new_zombie.translate(Vector2(0, -spawn_line.init_y))
	new_zombie.z_index = spawn_line.z_index
	new_zombie.scale *= spawn_line.scale_ratio
	add_child(new_zombie)
	spawned_zombies+=1

func new_round_setup(round_number, zombies_number):
	differing_zombies = clamp(round_number-1, 0, zombie_data.size() - 1)
	max_zombies = zombies_number
	print("ROUND NUMBER: ", round_number)
		

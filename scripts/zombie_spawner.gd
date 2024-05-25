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
	var new_zombie = zombie_scene.instantiate()
	set_zombie_data(new_zombie)
	connect_zombie_signals(new_zombie)
	add_child(new_zombie)
	new_zombie.add_to_group("Zombies")
	spawned_zombies+=1

func new_round_setup(round_number, zombies_number):
	differing_zombies = clamp(round_number-1, 0, zombie_data.size() - 1)
	max_zombies = zombies_number
	spawned_zombies = 0
	print("ROUND NUMBER: ", round_number)
		
func connect_zombie_signals(zombie):
	zombie.zombie_died.connect(round_controller.zombie_killed)
	
	
func set_zombie_data(zombie):
	var spawn_line = spawning_lines[randi_range(0, spawning_lines.size() - 1)]
	zombie.zombie_data = zombie_data[randi_range(0, differing_zombies)]
	zombie.translate(Vector2(0, -spawn_line.init_y))
	zombie.z_index = spawn_line.z_index
	zombie.scale *= spawn_line.scale_ratio
	

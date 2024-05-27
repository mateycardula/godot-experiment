extends Node2D

@export var zombie_scene : PackedScene
@export var time_controller : TimeControl
@export var spawning_lines : Array[SpawningData] = []
@export var zombie_data : Array[ZombieData] = []


var differing_zombies
var max_zombies
var spawned_zombies

var round_number
var enemies_in_round

signal test_signal

func _ready(): 	
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#func _on_timer_timeout():
	#test_signal.emit()
	#if(spawned_zombies<max_zombies):
		#spawn_zombie()
	#pass # Replace with function body.

func spawn_zombie(): 
	if(spawned_zombies<enemies_in_round):
		await time_controller.wait_for_random(2, 6)
		var new_zombie = zombie_scene.instantiate()
		set_zombie_data(new_zombie)
		add_child(new_zombie)
		new_zombie.add_to_group("Zombies")
		spawned_zombies+=1
		spawn_zombie()


func start_round():
	queue_free_zombies()
	differing_zombies = clamp(round_number-1, 0, zombie_data.size() - 1)
	spawned_zombies = 0
	spawn_zombie()
	print("ROUND NUMBER: ", round_number)
		
func set_zombie_data(zombie):
	var spawn_line = spawning_lines[randi_range(0, spawning_lines.size() - 1)]
	zombie.zombie_data = zombie_data[randi_range(0, differing_zombies)]
	zombie.translate(Vector2(0, -spawn_line.init_y))
	zombie.z_index = spawn_line.z_index
	zombie.scale *= spawn_line.scale_ratio
	
func set_round_number(_round_number : int):
	round_number = _round_number

func set_enemies_in_round(_enemies_in_round : int):
	enemies_in_round = _enemies_in_round

func queue_free_zombies():
	for child in get_children():
		if(child.is_in_group("Zombies")):
			child.queue_free()

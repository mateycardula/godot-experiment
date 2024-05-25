class_name Gun extends Node2D

@export var gun_data : GunData
@export var animation_controller : AnimatedSprite2D
var min
var nearest
var check
var zombie_spawner
# Called when the node enters the scene tree for the first time.
func _ready():
	min = 1000
	zombie_spawner = get_node("../ZombieSpawner")
	
	zombie_spawner.get_children()
	animation_controller.sprite_frames = gun_data.animation
	animation_controller.play()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_closest_enemy()
	
func sort_closest(a, b):
	return a.position < b.position

func get_closest_enemy():
	if(!get_tree().has_group("Zombies")):
		return
	var enemies = get_tree().get_nodes_in_group("Zombies")
	enemies.sort_custom(sort_closest)
	for enemy in enemies:
		enemy.modulate = Color.WHITE
	
	for enemy in enemies:
		if enemy.is_alive:
			enemy.modulate = Color.BROWN
			return enemy
	

func _on_timer_timeout():
	var zombie = get_closest_enemy()
	if (zombie != null):
		look_at(zombie.global_position)
		zombie.damage(gun_data.damage)
	pass # Replace with function body.

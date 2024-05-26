class_name Gun extends Node2D

@export var gun_data : GunData
@export var animation_controller : AnimatedSprite2D
@export var crosshair : Sprite2D

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
	nearest = get_closest_enemy()
	if (nearest != null):
		crosshair.visible = true
		crosshair.z_index = nearest.z_index+1
		crosshair.position = nearest.global_position
	else:
		crosshair.visible = false
		
func sort_closest(a, b):
	return a.position < b.position

func get_closest_enemy():
	if(!get_tree().has_group("Zombies")):
		return
	var enemies = get_tree().get_nodes_in_group("Zombies")
	enemies.sort_custom(sort_closest)

	for enemy in enemies:
		if enemy.is_alive:
			return enemy
	

func _on_timer_timeout():
	var zombie = get_closest_enemy()
	if (zombie != null):
		look_at(zombie.global_position)
		zombie.damage(gun_data.damage)
	pass # Replace with function body.

	

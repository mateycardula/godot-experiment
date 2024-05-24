class_name Zombie extends CharacterBody2D


@onready var animation_controller : AnimatedSprite2D = $AmimationsNode
@export var zombie_data : ZombieData
@export var health_controller : HealthController
var health : int 

func _ready():
	setup_zombie()
	pass

	
	
func _physics_process(delta):
	velocity.x = -1 * zombie_data.speed * 0.5
	move_and_slide()
	pass
	
func setup_zombie():
	animation_controller.sprite_frames = zombie_data.animation
	animation_controller.play()
	animation_controller.set_frame_and_progress(randi(), randf())
	animation_controller.speed_scale = 1/zombie_data.size
	scale *= zombie_data.size
	z_index += zombie_data.z_offset
	health_controller.initialize_health(zombie_data.health)
	pass	
	



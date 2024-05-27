class_name Zombie extends CharacterBody2D


@onready var animation_controller : AnimatedSprite2D = $AmimationsNode
@export var zombie_data : ZombieData
@export var health_controller : HealthController
@export var publish_signal: SignalPublisher
@export var time_control : TimeControl
	
var health : int 
var speed : int
var is_alive : bool

signal zombie_died

func _ready():
	setup_zombie()
	pass

func _physics_process(delta):
	velocity.x = -1 * speed * 0.5
	move_and_slide()
	pass
	
func setup_zombie():
	speed = zombie_data.speed
	animation_controller.sprite_frames = zombie_data.animation
	animation_controller.play("walk")
	animation_controller.play()
	animation_controller.set_frame_and_progress(randi(), randf())
	animation_controller.speed_scale = 1/zombie_data.size
	scale *= zombie_data.size
	z_index += zombie_data.z_offset
	is_alive = true
	health_controller.modulate.a = 0.5
	health_controller.initialize_health(zombie_data.health)
	pass	

func damage(_damage: int):
	health_controller.damage(_damage) 

func die():
	is_alive = false
	speed=0
	animation_controller.play("die")
	publish_signal.zombie_killed()
	drop_loot()
	
func change_state(state, state_controller):
	match state:
		States.state.PAUSE:
			print("ZOMBIE PAUSED")
		_:
			print("NO SUCH STATE")		
	pass

func drop_loot():
	publish_signal.drop_loot_signal(
		calculate_gold_drop(),
		global_position)
	pass

func calculate_gold_drop() -> int:
	return randi_range(
		zombie_data.gold_drop.get("From"), 
		zombie_data.gold_drop.get("To"))
	pass

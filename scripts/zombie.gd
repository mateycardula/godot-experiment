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
	var timer = Timer.new()
	publish_signal.zombie_killed()
	await time_control.wait_for(4)
	#await wait_for(animation_controller.animation.length())
	self.queue_free()

func wait_for(seconds : float):
	var timer : Timer
	timer = Timer.new()
	add_child(timer)
	timer.start(2.0)
	timer.paused = false
	await timer.timeout
	timer.queue_free()
	
func change_state(state, state_controller):
	match state:
		States.state.PAUSE:
			print("ZOMBIE PAUSED")
		_:
			print("NO SUCH STATE")		
	pass



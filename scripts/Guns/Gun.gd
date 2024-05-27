class_name Gun extends Node2D

@export var time_controller : TimeControl
@export var gun_data : GunData
@export var animation_controller : AnimatedSprite2D
@export var crosshair : Sprite2D
@export var publish_signal : SignalPublisher

@export var damage_component : Damage

var fire_rate 
var damage
var can_shoot : bool = true

var gun_damage_upgrades : Array[Upgrade] :
	set(array):
		gun_damage_upgrades = array
		publish_signal.all_signals.GUN_DAMAGE_UPGRADE_LIST_UPDATE.emit(gun_damage_upgrades)
		
var fire_rate_upgrades : Array[Upgrade] :
	set(array):
		fire_rate_upgrades = array
		publish_signal.all_signals.GUN_FIRE_RATE_UPGRADE_LIST_UPDATE.emit(fire_rate_upgrades)
		
var ticks_left_to_fire : int :
	set(value):
		if(value>0):
			can_shoot = false
			ticks_left_to_fire = value
		if(value == 0):
			can_shoot = true
			
func _ready():
	setup_gun()
	pass 
	
func _process(delta):
	var enemy = aim()
	if(enemy != null and can_shoot):
		shoot(enemy)
		
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

func shoot(enemy):
	animation_controller.play()
	enemy.damage(damage)
	damage_component.hit(enemy)
	ticks_left_to_fire = fire_rate
	pass

func aim() -> Object:
	var enemy = get_closest_enemy()
	if (enemy != null):
		crosshair.visible = true
		crosshair.z_index = enemy.z_index+1
		crosshair.position = enemy.global_position
		look_at(enemy.global_position)
		return enemy
	else:
		crosshair.visible = false
		return null

func update_fire_rate():
	ticks_left_to_fire-=1
	pass

func setup_gun():
	damage = gun_data.damage
	fire_rate = gun_data.ticks_per_shot
	gun_damage_upgrades = gun_data.dmg_upgrades
	fire_rate_upgrades = gun_data.fire_rate_upgrades
	animation_controller.sprite_frames = gun_data.animation
	pass

func upgrade_damage(d_damage : int):
	damage += d_damage
	print("NEW DAMAGE ", damage)
	pass

func upgrade_fire_rate(d_fire_rate : int):
	fire_rate -= d_fire_rate
	print("NEW FIRE RATE ", fire_rate)

func set_damage_upgrades (array):
	gun_damage_upgrades = array

func set_fire_rate_upgrades (array):
	fire_rate_upgrades = array

	

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
		publish_signal.all_signals.CURRENT_DAMAGE_UPGRADE.emit(gun_damage_upgrades.front())

var fire_rate_upgrades : Array[Upgrade] :
	set(array):
		fire_rate_upgrades = array
		
var ticks_left_to_fire : int :
	set(value):
		if(value>0):
			can_shoot = false
			ticks_left_to_fire = value
		if(value == 0):
			can_shoot = true
			
func _ready():
	setup_gun()
	publish_signal.all_signals.CURRENT_DAMAGE_UPGRADE.emit(gun_damage_upgrades.front())
	publish_signal.all_signals.CURRENT_FIRE_RATE_UPGRADE.emit(fire_rate_upgrades.front())
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
	damage_component.damage = gun_data.damage
	fire_rate = gun_data.ticks_per_shot
	gun_damage_upgrades = gun_data.dmg_upgrades
	fire_rate_upgrades = gun_data.fire_rate_upgrades
	animation_controller.sprite_frames = gun_data.animation
	pass

func upgrade_damage(d_damage : int):
	var upgrade_to_apply : Upgrade = gun_damage_upgrades.pop_front()
	publish_signal.all_signals.SPEND_GOLD.emit(upgrade_to_apply.cost)
	damage_component.damage += upgrade_to_apply.d_value
	publish_signal.all_signals.CURRENT_DAMAGE_UPGRADE.emit(gun_damage_upgrades.front())

func upgrade_fire_rate(d_fire_rate : int):
	var upgrade_to_apply : Upgrade = fire_rate_upgrades.pop_front()
	publish_signal.all_signals.SPEND_GOLD.emit(upgrade_to_apply.cost)
	fire_rate -= upgrade_to_apply.d_value
	publish_signal.all_signals.CURRENT_FIRE_RATE_UPGRADE.emit(fire_rate_upgrades.front())

func set_damage_upgrades (array):
	gun_damage_upgrades = array

func set_fire_rate_upgrades (array):
	fire_rate_upgrades = array

func upgrade(upgrade_type : UpgradeEnums.type):
	match upgrade_type:
		UpgradeEnums.type.DAMAGE:
			upgrade_damage(0)
		UpgradeEnums.type.FIRE_RATE:
			upgrade_fire_rate(0)


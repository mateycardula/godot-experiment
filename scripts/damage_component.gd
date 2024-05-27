class_name Damage extends Node

@export var upgrades : Array[GunUpgrades]

var damage : int : 
	set(value):
		damage = value

func hit (object : Object):
	var enemy_health_component = object.find_child("HealthController")
	if enemy_health_component != null:
		print("CAN ATTACK ", object)
	pass



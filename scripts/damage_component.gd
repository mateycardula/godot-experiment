class_name Damage extends Node

@export var upgrades : Array[GunUpgrades]

var damage : int : 
	set(value):
		damage = value

func hit (object : Object):
	var enemy_health_component : HealthController = object.find_child("HealthController")
	if enemy_health_component != null:
		enemy_health_component.damage(damage)
	pass

 


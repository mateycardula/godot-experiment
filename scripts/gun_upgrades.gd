class_name GunUpgrades extends Node


@export var dmg_upgrades : Array[Upgrade]
var gun

func _ready():
	gun = get_parent()

class_name ZombieSignalController extends Node

signal zombie_killed_signal()

func emit_zombie_killed():
	zombie_killed_signal.emit()



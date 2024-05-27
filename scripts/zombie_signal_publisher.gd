class_name ZombieSignalPublisher extends SignalPublisher

func zombie_killed():
	all_signals.ZOMBIE_KILLED_SIGNAL.emit()
	pass

func drop_loot_signal(amount : int, position : Vector2):
	all_signals.DROP_GOLD.emit(amount)
	all_signals.DROP_GOLD_AT.emit(amount, position)
	pass

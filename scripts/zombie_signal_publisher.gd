class_name ZombieSignalPublisher extends SignalPublisher

func zombie_killed():
	all_signals.ZOMBIE_KILLED_SIGNAL.emit()
	pass



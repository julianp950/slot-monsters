class_name Enemy
extends Node

@export var stats: Stats

func take_damage(damage: float) -> void:
	stats.take_damage(damage)
	
	if stats.is_dead:
		die()
	
func die() -> void:
	queue_free()

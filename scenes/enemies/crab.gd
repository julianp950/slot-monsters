extends Node2D

@export var health_points: float;

func remove_health(amount: int) -> void:
	health_points -= amount
	print(health_points)
	if health_points <= 0:
		health_points = 0
		die()

func die() -> void:
	queue_free()

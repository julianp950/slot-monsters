class_name Enemy
extends Node

@onready var health_bar: ProgressBar = $HPBarEnemies
@export var stats: Stats

func _ready() -> void:
	_update_health_bar()

func _update_health_bar() -> void:
	health_bar.value = stats.current_hp_percentage

func take_damage(damage: float) -> void:
	stats.take_damage(damage)
	
	_update_health_bar()
	
	if stats.is_dead:
		die()
	
func die() -> void:
	queue_free()

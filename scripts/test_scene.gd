extends Node

var value: float = 0.0
var speed: float = 200.0     # How fast it moves (units per second)
var direction: int = 1       # 1 = going up, -1 = going down
var stopped: bool = false
#@onready var label: Label = $GUI/force_str
@onready var musicplayer: AudioStreamPlayer = $musicplayer
@onready var sfx: AudioStreamPlayer2D = $sfxplayer

func _ready() -> void:
	musicplayer.play()   # Start music on scene load

func _process(delta: float) -> void:
	if stopped:
		return
	
	# Update value
	value += direction * speed * delta
	
	# Bounce at limits 0 and 100
	if value >= 100.0:
		value = 100.0
		direction = -1
	elif value <= 0.0:
		value = 0.0
		direction = 1
	
	# Update the UI text
	#label.text = str(round(value))


func _input(event: InputEvent) -> void:
	var crab = $Crab

	if event.is_action_pressed("ui_accept") or (event is InputEventKey and event.keycode == KEY_SPACE):
		if stopped == false:
			crab.take_damage(round(value))
			sfx.play()
			stopped = true

extends Node2D

const shots = preload("res://bullet_scene/bullet.tscn")

@onready var spawn: Marker2D = $Marker2D
@onready var bullet_timer : Timer = $Timer
var is_shooting = false

func _ready() -> void:
	bullet_timer.wait_time = 0.2  # Time between each bullet spawn

func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
	else:
		scale.y = 1

		
	if Input.is_action_pressed("shoot"):
		if not is_shooting:
			is_shooting = true
			bullet_timer.start()
	else:
		if is_shooting:
			is_shooting = false
			bullet_timer.stop()



func _on_timer_timeout() -> void:
	var bullet = shots.instantiate()
	get_tree().root.add_child(bullet)
	bullet.global_position = spawn.global_position
	bullet.rotation = rotation

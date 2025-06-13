extends CharacterBody2D
@export var speed = 100

func _ready() -> void:
	position = Vector2(615, 545)
	
	

func _process(_delta: float) -> void:	
	
	var mouse_pos = get_global_mouse_position()
	var char_pos = global_position
	
	if mouse_pos.x > char_pos.x:
		$Player.scale.x = abs($Player.scale.x)
		$Node2D.position = Vector2(8.5, 3)
	else:
		$Player.scale.x = -abs($Player.scale.x)
		$Node2D.position = Vector2(-8.5,3)
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed 
	move_and_slide()

extends CharacterBody2D

@export var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(615,545)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed 
	move_and_slide()
	

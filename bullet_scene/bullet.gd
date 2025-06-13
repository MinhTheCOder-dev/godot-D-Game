extends Area2D



const speed: int = 300




func _process(delta: float) -> void:
	position += transform.x * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body is StaticBody2D:
		queue_free()

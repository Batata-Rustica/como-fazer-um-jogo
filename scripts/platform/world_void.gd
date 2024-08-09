extends Area2D



func _on_body_entered(body):
	if body.has_method("player"):
		body.position.y = 0
		body.velocity.y = 0

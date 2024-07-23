extends Area2D

func _on_body_entered(body):
	if body.has_method("idea"):
		body.queue_free()
	elif body.has_method("spark"):
		body.queue_free()

extends Area2D


func _on_body_entered(body):
	if (body.is_in_group("Player")):
		if Dialogic.current_timeline == null:
			Dialogic.start("timeline")


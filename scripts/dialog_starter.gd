extends Area2D

@onready var prof_sabio = $".."
@onready var dialog_prof_sabio = $"."

var timeline_name = prof_sabio.get_name()

func _on_body_entered(body):
	if (body.is_in_group("Player")):
		if Dialogic.current_timeline == null:
			Dialogic.start(timeline_name)


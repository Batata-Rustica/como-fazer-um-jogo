extends Area2D

@onready var dialog = $dialog


func _on_body_entered(body):
	if (body.is_in_group("Player")):
		

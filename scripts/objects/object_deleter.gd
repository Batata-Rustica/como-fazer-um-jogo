extends Area2D

@onready var gameover = $"../../gameover"
@onready var gameover_wait = $"../../gameover_wait"
@onready var spawner = $"../../spawner"

func _on_body_entered(body):
	if body.has_method("idea"):
		check_gameover()
		body.queue_free()
	elif body.has_method("spark"):
		body.queue_free()

func check_gameover():
	Global.hearts -= 1
	if (Global.hearts == 0):
		gameover.visible = true
		spawner.queue_free()
		gameover_wait.start()

func _on_gameover_wait_timeout():
	get_tree().change_scene_to_file("res://scenes/main/level_5.tscn")

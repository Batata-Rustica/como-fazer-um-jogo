extends Node2D

@onready var thought = $player/thought
@onready var player = $player

# Called when the node enters the scene tree for the first time.
func thinking():
	player.stop = true
	thought.visible = true
	await get_tree().create_timer(2).timeout
	thought.queue_free()
	player.stop = false

func _on_level_name_screen_tree_exited():
	thinking()

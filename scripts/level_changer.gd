extends Area2D

const BEGIN_FILE = "res://scenes/main/level_"

func _on_body_entered(body):
	if (body.is_in_group("Player")):
		var current_level = get_tree().current_scene.scene_file_path
		var current_level_number = current_level.to_int()
		var next_level_number = 1 if current_level_number == 2 else 2
		var next_level = BEGIN_FILE + str(next_level_number) + ".tscn"
		get_tree().change_scene_to_file(next_level)
		

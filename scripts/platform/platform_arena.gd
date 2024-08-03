extends Node2D

@onready var panel = $game_over_screen
@onready var label = $game_over_screen/Label
const sword = preload("res://resources/UI/tool_sword_a.png")
var enemies = 9
@onready var platform_player = $platform_player


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.weapon_equipped = true
	$platform_player/Camera2D.zoom.y = 6
	$platform_player/Camera2D.zoom.x = 6
	Input.set_custom_mouse_cursor(sword)

func _process(delta):
	if $platform_player != null:
		if Global.player_alive == false:
			$platform_player/Camera2D.zoom.y = 8
			$platform_player/Camera2D.zoom.x = 8
	elif $platform_player == null:
		panel.visible = true
		if Input.is_action_pressed("force_respawn"):
			get_tree().change_scene_to_file("res://scenes/main/level_5.tscn")
			Engine.time_scale = 1
	
	if (enemies <= 0):
		get_tree().change_scene_to_file("res://scenes/main/the_end.tscn")
		label.text = "Você ganhou!\nAperte Ctrl+Q para sair"
		if Input.is_action_pressed("force_exit"):
			get_tree().quit()


func _on_flying_enemy_death():
	enemies -= 1

func _on_flying_enemy_2_death():
	enemies -= 1

func _on_flying_enemy_3_death():
	enemies -= 1

func _on_flying_enemy_4_death():
	enemies -= 1

func _on_flying_enemy_5_death():
	enemies -= 1

func _on_flying_enemy_6_death():
	enemies -= 1

func _on_flying_enemy_7_death():
	enemies -= 1

func _on_flying_enemy_8_death():
	enemies -= 1

func _on_flying_enemy_9_death():
	enemies -= 1

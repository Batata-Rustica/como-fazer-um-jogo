extends Node2D

@onready var panel = $game_over_screen
@onready var label = $game_over_screen/Label
const sword = preload("res://resources/UI/tool_sword_a.png")

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
			get_tree().change_scene_to_file("res://scenes/platform/platform_arena.tscn")
			Engine.time_scale = 1

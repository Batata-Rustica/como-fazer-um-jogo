extends Node2D

@onready var level_changer = $level_changer
@onready var player = $player
@onready var transition = $player/camera/transition_container/transition
@onready var after_dialog = $after_dialog

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.timeline_started.connect(_on_timeline_started)

func _on_timeline_ended():
	level_changer.monitoring = true
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	player.process_mode = Node.PROCESS_MODE_INHERIT

func _on_timeline_started():
	transition.play("DEFAULT")
	await get_tree().create_timer(1.1).timeout
	player.process_mode = Node.PROCESS_MODE_DISABLED
	player.position = after_dialog.position

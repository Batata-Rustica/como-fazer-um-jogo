extends Area2D

@export var npc_dialog: String
var player_can_dialog = false
var force_dialog = false
@onready var dialog_starter = $dialog_starter

func _ready():
	if npc_dialog == "introduction":
		force_dialog = true
	Dialogic.timeline_ended.connect(timeline_end)

func _on_dialog_starter_body_entered(body):
	if body.has_method("player"):
		player_can_dialog = true

func _on_dialog_starter_body_exited(body):
	if body.has_method("player"):
		player_can_dialog = false

func _process(delta):
	if player_can_dialog:
		if force_dialog == true:
			start_dialog(npc_dialog)
		else:
			if Input.is_action_just_pressed("click"):
				start_dialog(npc_dialog)

func start_dialog(timeline_name):
	if Dialogic.current_timeline == null:
		Dialogic.start(timeline_name)

func timeline_end():
		force_dialog = false

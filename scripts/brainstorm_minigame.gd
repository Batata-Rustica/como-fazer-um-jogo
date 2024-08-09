extends Node2D

@onready var score_label = $Camera2D/score_label
@onready var hearts_label = $Camera2D/hearts_label
@onready var brainstorm_player = $brainstorm_player

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Global.brainstorm_entered()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	score_label.text="Score: " + str(brainstorm_player.score) + "/500"
	hearts_label.text = str(Global.hearts)

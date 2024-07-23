extends Node2D

@onready var score_label = $Camera2D/score_label
@onready var brainstorm_player = $brainstorm_player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	score_label.text="Score: " + str(brainstorm_player.score)

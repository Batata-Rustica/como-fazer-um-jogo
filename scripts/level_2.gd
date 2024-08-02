extends Node2D

@onready var level_changer = $level_changer

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.timeline_ended.connect(_on_timeline_ended)

func _on_timeline_ended():
	level_changer.monitoring = true
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)

extends Node2D

const SPARK = preload("res://scenes/objects/spark.tscn")
const IDEA = preload("res://scenes/objects/idea.tscn")

var spawn_points := []

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in get_children():
		if i is Marker2D:
			spawn_points.append(i)

func _on_timer_timeout():
	var spawn_point = spawn_points[randi() % spawn_points.size()]
	
	var object = choose_scene().instantiate()
	object.position = spawn_point.position
	self.add_child(object)
	
func choose_scene():
	if randi() % 3 > 1:
		return IDEA
	else:
		return SPARK

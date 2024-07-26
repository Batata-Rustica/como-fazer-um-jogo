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
	var pos := randi() % spawn_points.size()
	var spawn_point = spawn_points[pos]
	
	var object = choose_scene(pos).instantiate()
	object.position = spawn_point.position
	self.add_child(object)
	
func choose_scene(pos):
	# Nas pontas só pode chover raios, pois não dá tempo de percorrer
	# para pegar um cérebro do outro lado do mapa
	if (pos == 0 or pos == 1 or pos == 8 or pos == 9):
		return SPARK
	if randi() % 2 == 0:
		return IDEA
	else:
		return SPARK

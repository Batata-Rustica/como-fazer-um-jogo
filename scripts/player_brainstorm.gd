extends CharacterBody2D

var state_machine
const speed = 100
const run_multiplier = 2
const acceleration = 0.2

func _ready():
	pass

func _process(_delta):
	pass

func _physics_process(_delta):
	move()
	move_and_slide()
	
func move():
	var direction = Input.get_vector("left", "right", "up", "down")
	var movement = direction.normalized()*speed
	
	if Input.is_action_pressed("shift"):
		velocity = lerp(velocity,movement*run_multiplier, acceleration)
	else:
		velocity = lerp(velocity,movement,acceleration)

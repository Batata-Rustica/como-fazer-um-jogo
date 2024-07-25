extends CharacterBody2D

@export var score = 0

const speed = 600

const acceleration = 100
const friction = 130
const dash_boost = 5
var dash_available = 0.0
var dash_cd = 0.5

func _process(_delta):
	if Input.is_action_pressed("force_exit"): 
		get_tree().quit()
		#apertar Ctrl+Q ou Select (joystick) fecha a cena do player

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var input_dir: Vector2 = input()
	velocity.y = 1
	if input_dir != Vector2.ZERO:
		accelerate(input_dir)
	else :
		add_friction()
	player_movement()
	dash()

func input() -> Vector2:
	var input_dir = Vector2.ZERO
	
	input_dir.x = Input.get_axis("left","right")
	input_dir = input_dir.normalized()
	return input_dir

func accelerate(direction):
	velocity = velocity.move_toward(speed * direction, acceleration)

func add_friction():
	velocity = velocity.move_toward(Vector2.ZERO, friction)

func dash():
	if Input.is_action_just_pressed("shift") and Time.get_ticks_msec() > dash_available:
		velocity = velocity*dash_boost
		dash_available = Time.get_ticks_msec() + dash_cd*1000

func player_movement():
	move_and_slide()
	

func _on_collecting_area_body_entered(body):
	if body.has_method("idea"):
		score += 10
		body.queue_free()
	elif body.has_method("spark"):
		score -= 15
		body.queue_free()

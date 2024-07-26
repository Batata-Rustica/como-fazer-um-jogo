extends CharacterBody2D

@export var score: int = 0
@onready var gamewin = $"../gamewin"
@onready var gameover_wait = $"../gameover_wait"
@onready var score_label = $"../gameover/score"
@onready var spawner = $"../spawner"


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
		score += 20
		check_win()
		body.queue_free()
	elif body.has_method("spark"):
		score -= score/2
		body.queue_free()

func check_win():
	if (score >= 500):
		gamewin.visible = true
		spawner.queue_free()
		gameover_wait.start()

func _on_gameover_visibility_changed():
	score_label.text = "Fim de jogo\nScore: " + str(score)

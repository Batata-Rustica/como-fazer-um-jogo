extends CharacterBody2D

var state_machine
const speed = 100
const run_multiplier = 2
const acceleration = 0.2

@export_category("Objects")
@export var animation_tree: AnimationTree
@onready var footstep = $player_audios/footsteps


func _ready():
	state_machine = animation_tree["parameters/playback"]

func _process(_delta):
	if Input.is_action_pressed("force_exit"): 
		get_tree().quit()
		#apertar Ctrl+Q ou Select (joystick) fecha a cena do player

func _physics_process(_delta):
	move()
	animate()
	move_and_slide()
	
func move():
	var direction = Input.get_vector("left", "right", "up", "down")
	var movement = direction.normalized()*speed
	
	if direction != Vector2.ZERO:
		animation_tree["parameters/idle/blend_position"] = direction.normalized()
		animation_tree["parameters/walk/blend_position"] = direction.normalized()
		animation_tree["parameters/run/blend_position"] = direction.normalized()
	
	if Input.is_action_pressed("shift"):
		velocity = lerp(velocity,movement*run_multiplier, acceleration)
	else:
		velocity = lerp(velocity,movement,acceleration)
	

func animate():
	if velocity.length() > 10:
		if Input.is_action_pressed("shift"):
			state_machine.travel("run")
			return
		else:
			state_machine.travel("walk")
		return
	else: state_machine.travel("idle")
	_play_footstep_sound()
	#if Input.is_action_pressed("shift"):
		#play_footstep_sound(2)
	#else:
		#play_footstep_sound(1)


func _play_footstep_sound():
	#footstep.pitch_scale = scale
	footstep.play()

extends CharacterBody2D

const speed = 75.0
const jump_power = -1500.0
var gravity = 2500

func _process(delta):
	if Input.is_action_pressed("force_exit"):
		get_tree().quit()
		#apertar Ctrl+Q ou Select (joystick) fecha a cena do player

func _physics_process(delta):
	falling(delta)
	jump()
	move()
	move_and_slide()

func  falling(delta):
	if  !is_on_floor():
		velocity.y = gravity * delta

func jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power

func move():
	var direction = Input.get_axis("left","right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

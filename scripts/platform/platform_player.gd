extends CharacterBody2D

@onready var sprite = $sprite

const speed = 130.0
const run_multiplier = 2
const gravity = 980
const jump_power = -.3

var weapon_equipped = false

func _process(delta):
	if Input.is_action_pressed("force_exit"): 
		get_tree().quit()
		#apertar Ctrl+Q ou Select (joystick) fecha a cena do player
	
	if Input.is_action_pressed("force_respawn"):
		self.position.y = 0

func _physics_process(delta):
	move(delta)

func move(delta):
	var direction = Input.get_axis("left","right")
	
	if direction:
		if Input.is_action_pressed("shift"):
			velocity.x = move_toward(velocity.x,direction*speed*run_multiplier, speed)
		else:
			velocity.x = move_toward(velocity.x,direction*speed, speed)
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	if not is_on_floor():
		velocity.y += gravity*delta
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = gravity*jump_power
	elif Input.is_action_just_released("jump"):
			velocity.y += (gravity*6)*delta
	
	move_and_slide()
	handle_animation(direction)

func handle_animation(direction):
	if !weapon_equipped:
		sprite.play("idle")

func player():
	pass

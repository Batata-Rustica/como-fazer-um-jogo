extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 80
const RUN_MULTIPLIER = 2

func _physics_process(_delta):
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	var movement = direction.normalized() * SPEED
	
	if Input.is_action_pressed("shift"):
		velocity = lerp(velocity, movement * RUN_MULTIPLIER, 1)
		animated_sprite.speed_scale = 2
	else:
		velocity = lerp(velocity, movement, 1)
		animated_sprite.speed_scale = 1
	
	if velocity.y > 0:
		animated_sprite.play("move_down")
	elif velocity.y < 0:
		animated_sprite.play("move_up")
	elif velocity.x > 0:
		animated_sprite.play("move_right")
	elif velocity.x < 0:
		animated_sprite.play("move_left")
	else:
		animated_sprite.play("idle")
	
	move_and_slide()

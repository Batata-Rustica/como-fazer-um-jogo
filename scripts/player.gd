extends CharacterBody2D


var speed = 200  # speed in pixels/sec
@onready var sprite = $sprite
@onready var collision = $collision

func _process(delta):
	if Input.is_action_pressed("force_exit"): 
		get_tree().quit()
		#apertar Ctrl+Q ou Select (joystick) fecha a cena do player

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if Input.is_action_pressed("shift"):
		velocity = (direction*2.5*speed)
		sprite.speed_scale = 2
		if velocity.x >= 0:
			sprite.rotation_degrees += 10
		else: sprite.rotation_degrees -= 10
	else:
		velocity = (direction*speed)
		sprite.speed_scale = 1
		sprite.rotation_degrees = 0
	
	if velocity.x == 0 && velocity.y == 0:
		sprite.play("idle")
	elif velocity.x > 0:
		sprite.play("walk_right")
	elif velocity.x < 0:
		sprite.play("walk_left")
	elif velocity.y > 0:
		sprite.play("walk_front")
	elif velocity.y < 0:
		sprite.play("walk_rear")

	move_and_slide()

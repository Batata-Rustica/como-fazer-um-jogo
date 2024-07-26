extends CharacterBody2D

var player: CharacterBody2D
@onready var sprite = $sprite
const speed = 30
var direction: Vector2

var is_chasing: bool

func _ready():
	is_chasing = true

func _process(delta):
	move(delta)
	handle_animation()

func move(delta):
	if is_chasing:
		player = Global.player
		velocity = position.direction_to(player.position)*speed
		direction.x = abs(velocity.x) / velocity.x
	if !is_chasing:
		velocity += direction * speed * delta
	move_and_slide()

func _on_timer_timeout():
	$Timer.wait_time = choose([1.0, 1.5, 2.0])
	if !is_chasing:
		direction = choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])
		print(direction)

func handle_animation():
	sprite.play("flying")
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true

func choose(array):
	array.shuffle()
	return array.front()


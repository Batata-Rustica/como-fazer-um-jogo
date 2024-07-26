extends CharacterBody2D

const max_health = 20
const min_health = 1
@onready var health = max_health
var dead = false
var hit = false
@onready var is_roaming = false
var is_chasing: bool
var damage = Global.flying_str

var player: CharacterBody2D
@onready var sprite = $sprite
const speed = 30
var direction: Vector2



func _ready():
	is_chasing = true

func _process(delta):
	move(delta)
	handle_animation()
	
	if is_on_floor() and dead:
		await get_tree().create_timer(2.0).timeout
		self.queue_free()
		Global.platform_score

func move(delta):
	if !dead:
		is_roaming = true
		if !hit and is_chasing:
			player = Global.player
			velocity = position.direction_to(player.position)*speed
			direction.x = abs(velocity.x) / velocity.x
		elif hit:
			var knockback_dir = position.direction_to(player.position)*-50
			velocity = knockback_dir
		if !is_chasing:
			velocity += direction * speed * delta
	elif dead:
		velocity.y += 10*delta
		velocity.x = 0
	move_and_slide()

func _on_timer_timeout():
	$Timer.wait_time = choose([1.0, 1.5, 2.0])
	if !is_chasing:
		direction = choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])
		print(direction)

func handle_animation():
	if !dead and !hit:
		sprite.play("flying")
		if direction.x > 0:
			sprite.flip_h = false
		elif direction.x < 0:
			sprite.flip_h = true
	elif !dead and hit:
		sprite.play("hurt")
		await get_tree().create_timer(1.0).timeout
		hit = false
	elif dead and is_roaming:
		is_roaming = false
		sprite.play("death")
		set_collision_layer_value(1, true)
		set_collision_layer_value(2, false)

func choose(array):
	array.shuffle()
	return array.front()



func _on_hitbox_area_entered(area):
	if area.has_method("damage_zone"):
		var damage = Global.player_str
		take_damage(damage)

func take_damage(damage):
	health -= damage
	hit = true
	if health < 0:
		health = 0
		dead = true

func flying_enemy():
	pass

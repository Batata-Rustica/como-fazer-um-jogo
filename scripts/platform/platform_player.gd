extends CharacterBody2D

@onready var sprite = $sprite
@onready var damage_zone = $damage_zone



const speed = 120.0
const run_multiplier = 1.5
const gravity = 980
const jump_power = -.3

const max_jumps = 2
var jumped = 1

var weapon_equipped: bool
var attacking: bool

func _ready():
	Global.player = self
	var damage_zone_collider = damage_zone.get_node("CollisionShape2D")
	damage_zone_collider.disabled = true

func _process(delta):
	if Input.is_action_pressed("force_exit"): 
		get_tree().quit()
		#apertar Ctrl+Q ou Select (joystick) fecha a cena do player
	
	if Input.is_action_pressed("force_respawn"):
		self.position.y = 0

func _physics_process(delta):
	weapon_equipped = Global.weapon_equipped
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
	if is_on_floor():
		jumped = 0
	
	if Input.is_action_just_pressed("jump"):
		if jumped < max_jumps:
			jumped += 1
			velocity.y = gravity*jump_power
	elif Input.is_action_just_released("jump"):
			velocity.y += (gravity*6)*delta
	
	if weapon_equipped and !attacking:
		if Input.is_action_just_pressed("click"):
			attacking = true
			handle_attack_animation()
	
	move_and_slide()
	handle_animation(direction)

func handle_animation(direction):
	if !weapon_equipped:
		if !velocity:
			sprite.play("idle")
		if velocity:
			sprite.play("walk")
			toggle_flip_sprite(direction)
	if weapon_equipped and !attacking:
		if !velocity:
			sprite.play("idle_armed")
		if velocity:
			sprite.play("walk_armed")
			toggle_flip_sprite(direction)

func toggle_flip_sprite(direction):
	if direction < 0:
		sprite.flip_h = true
		damage_zone.scale.x = -1
	if direction > 0:
		sprite.flip_h = false
		damage_zone.scale.x = 1

func handle_attack_animation():
	if weapon_equipped and attacking:
		sprite.play("attack")
		toggle_damage_zone()

func toggle_damage_zone():
	var damage_zone_collision = damage_zone.get_node("CollisionShape2D")
	var wait_time = 0.7
	damage_zone_collision.disabled = false
	await get_tree().create_timer(wait_time).timeout
	damage_zone_collision.disabled = true

func set_damage():
	var damage_dealt = 18


func player():
	pass

func _on_sprite_animation_finished():
	attacking = false

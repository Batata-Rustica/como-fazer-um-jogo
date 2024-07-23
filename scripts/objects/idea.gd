extends RigidBody2D

const gravity_force = 3

func idea():
	pass

var velocity = Vector2.ZERO

func falling(measure):
	velocity.y = gravity_force * measure
	if velocity.y == 0:
		queue_free()

func _physics_process(delta):
	falling(delta)


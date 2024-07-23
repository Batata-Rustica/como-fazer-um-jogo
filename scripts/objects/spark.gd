extends RigidBody2D

const gravity_force = 2.5

func spark():
	pass

var velocity = Vector2.ZERO

func falling(measure):
	velocity.y = gravity_force * measure
	if velocity.y == 0:
		queue_free()

func _physics_process(delta):
	falling(delta)
	

class_name Player
extends CharacterBody2D


const SPEED: float = 100.0
const SLOW_RATIO: float = 0.6


func _physics_process(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction.normalized() * SPEED
	else:
		velocity = velocity.lerp(Vector2.ZERO, SLOW_RATIO)
	
	var collided = move_and_slide()
	
	if collided:
		var col: Object = get_last_slide_collision().get_collider()
		if col is not PhysicsObject:
			return
		
		var object: PhysicsObject = col as PhysicsObject
		object.push(velocity)

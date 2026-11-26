extends CharacterBody2D


const SPEED: float = 100.0
const SLOW_RATIO: float = 0.6


func _physics_process(delta: float) -> void:
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction.normalized() * SPEED
	else:
		velocity = velocity.lerp(Vector2.ZERO, SLOW_RATIO)
	
	move_and_slide()

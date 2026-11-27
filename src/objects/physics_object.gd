class_name PhysicsObject
extends CharacterBody2D

## The base velocity multiplier when being pushed.
@export var velocity_multiplier: float = 1.0


## Moves an object using the velocity vector and velocity_multiplier.
func push(dir: Vector2, multiplier: float = velocity_multiplier) -> void:
	velocity = multiplier * dir
	print(velocity)
	move_and_slide()


## Moves an object using the displacement vector.
func displace(dir: Vector2) -> void:
	global_position += dir

extends RigidBody2D


## The maximum length the laser can travel
@export var max_length: float = 512.0


func _ready() -> void:
	var raycast_target: Vector2 = max_length * global_transform.x
	$RayCast.target_position = raycast_target


func _physics_process(delta: float) -> void:
	_update_length()


## Updates the laser's length based to either max_length or to the RayCast2D's target
## Returns the new length
func _update_length() -> float:
	var length: float = 0
	if not $RayCast.is_colliding():
		length = max_length
	else:
		var offset: Vector2 = $RayCast.get_collision_point() - $RayCast.global_position
		length = offset.length()
	
	_set_length(length)
	
	return length


## Changes the laser's length to the specified length
func _set_length(new_len: float) -> void:
	$Laser.region_rect.size.x = new_len

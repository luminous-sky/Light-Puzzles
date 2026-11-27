class_name LaserPointer
extends RigidBody2D


## The maximum length the laser can travel.
@export var max_length: float = 512.0

## The color this laser pointer should output.
@export var color: LaserColor.LASER_COLOR = LaserColor.LASER_COLOR.NONE


func _ready() -> void:
	var raycast_target: Vector2 = max_length * global_transform.x
	$RayCast.target_position = raycast_target
	
	$LaserColor.color = color
	$LaserColor.update_color()


func _physics_process(delta: float) -> void:
	_update_length()


## Updates the laser's length based to either max_length or to the RayCast2D's target.
## Returns the new laser length.
func _update_length() -> float:
	var length: float = 0
	if not $RayCast.is_colliding():
		length = max_length
	else:
		var offset: Vector2 = $RayCast.get_collision_point() - $RayCast.global_position
		length = offset.length()
	
	$LaserColor.set_length(length)
	
	return length

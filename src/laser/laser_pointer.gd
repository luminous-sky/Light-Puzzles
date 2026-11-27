class_name LaserPointer
extends RigidBody2D


## The maximum length the laser can travel.
@export var max_length: float = 512.0

## The color this laser pointer should output.
@export var color: LaserColor.LASER_COLOR = LaserColor.LASER_COLOR.NONE

## Whether this laser pointer is enabled.
@export var enabled: bool = true


## The current gate that this laser pointer hits.
## For Gate subclasses, this is unused.
var current_gate: Gate = null


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
	if not enabled:
		$LaserColor.set_length(0.0)
		return 0.0
	
	var length: float = 0.0
	if not $RayCast.is_colliding():
		length = max_length
		
		if current_gate:
			current_gate.remove_laser(self)
			current_gate = null
	else:
		var offset: Vector2 = $RayCast.get_collision_point() - $RayCast.global_position
		length = offset.length()
		
		var end_object: Object = $RayCast.get_collider()
		if end_object is Gate:
			current_gate = end_object
			current_gate.add_laser(self)
		elif current_gate and end_object != current_gate:
			current_gate.remove_laser(self)
			current_gate = null
	
	$LaserColor.set_length(length)
	
	return length

class_name Reflector
extends RigidBody2D

var lasers: Dictionary[LaserPointer, LaserPointer] = {}

@onready var reflection: Node = $Reflection


## Adjusts the reflected laser's position based on the initial collision point and normal.
## Returns the raycast's collided object or null if there was no collision.
func update_laser(laser: LaserPointer, col_pt: Vector2, new_len: float) -> Object:
	var data: LaserPointer = null
	
	if laser in lasers:
		data = lasers[laser]
	else:
		data = reflection.duplicate()
		data.visible = true
		add_child(data)
		
		lasers[laser] = data
	
	var sprite: LaserColor = data.get_node("LaserColor")
	var raycast: RayCast2D = data.get_node("RayCast")
	
	# Verify that the nodes exist
	assert(data != null)
	assert(sprite != null)
	assert(raycast != null)
	
	data.global_position = col_pt
	
	var reflection_vector: Vector2 = global_transform.y
	var origin_offset: Vector2 = laser.global_position - self.global_position
	var target_offset: Vector2 = origin_offset.reflect(reflection_vector)
	var target_ray = data.global_position + target_offset
	
	data.look_at(target_ray)
	data.rotation += (PI / 2)
	
	data.color = laser.color
	sprite.color = laser.color
	sprite.update_color()
	
	data.max_length = new_len
	data.update_raycast_length(new_len)
	return raycast.get_collider()


## Removes a laser from this mirror.
func remove_laser(laser: LaserPointer) -> void:
	if laser not in lasers:
		return
	
	var data: LaserPointer = lasers[laser]
	data.queue_free()
	
	lasers.erase(laser)

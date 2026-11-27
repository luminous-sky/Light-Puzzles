@abstract
class_name Gate
extends LaserPointer

var lasers: Array[LaserPointer]


func _ready() -> void:
	enabled = false
	
	super._ready()


func add_laser(laser: LaserPointer) -> void:
	if laser in lasers:
		return
	
	lasers.append(laser)
	
	enabled = true
	
	color = get_output()
	$LaserColor.color = color
	$LaserColor.update_color()


func remove_laser(laser: LaserPointer) -> void:
	var pos: int = lasers.find(laser)
	if pos < 0:
		return
	
	lasers.remove_at(pos)
	
	if len(lasers) == 0:
		enabled = false
	
	color = get_output()
	$LaserColor.color = color
	$LaserColor.update_color()


@abstract func get_output() -> LaserColor.LASER_COLOR

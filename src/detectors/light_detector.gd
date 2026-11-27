extends Gate

@export var expected_color: LaserColor.LASER_COLOR = LaserColor.LASER_COLOR.NONE
@export var output_color: LaserColor.LASER_COLOR = LaserColor.LASER_COLOR.NONE


func get_output() -> LaserColor.LASER_COLOR:
	var res: ColorModel.RGB = ColorModel.RGB.NONE
	
	for laser: LaserPointer in lasers:
		var c: LaserColor.LASER_COLOR = laser.color
		if c not in ColorModel.RGB.values():
			continue
		
		res = ColorModel.add_rgb(res, c as ColorModel.RGB)
	
	if res not in LaserColor.LASER_COLOR.values():
		print("Unimplemented output color!")
		return LaserColor.LASER_COLOR.NONE
	
	var res_conv: LaserColor.LASER_COLOR = res as LaserColor.LASER_COLOR
	if res_conv != expected_color:
		enabled = false
		return LaserColor.LASER_COLOR.NONE 
	
	enabled = true
	return output_color

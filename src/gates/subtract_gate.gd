extends Gate


func get_output() -> LaserColor.LASER_COLOR:
	var res: ColorModel.RGB = ColorModel.RGB.WHITE
	
	for laser: LaserPointer in lasers:
		var c: LaserColor.LASER_COLOR = laser.color
		if c not in ColorModel.RGB.values():
			continue
		
		res = ColorModel.sub_rgb(res, c as ColorModel.RGB)
	
	if res not in LaserColor.LASER_COLOR.values():
		print("Unimplemented output color!")
		return LaserColor.LASER_COLOR.NONE
	
	return res as LaserColor.LASER_COLOR

class_name LaserColor
extends Sprite2D


## Aligned to ColorModel enums to make conversions easier
enum LASER_COLOR {
	NONE = ColorModel.RGB.NONE,
	RED = ColorModel.RGB.RED,
	GREEN = ColorModel.RGB.GREEN,
	BLUE = ColorModel.RGB.BLUE,
	YELLOW = ColorModel.RGB.YELLOW,
	MAGENTA = ColorModel.RGB.MAGENTA,
	CYAN = ColorModel.RGB.CYAN,
	WHITE = ColorModel.RGB.WHITE,
}

static var sprites: Dictionary[LASER_COLOR, CompressedTexture2D] = {
	LASER_COLOR.NONE: preload("uid://cdha162jvnxn3"),
	LASER_COLOR.RED: preload("uid://ckqulie4bhgpm"),
	LASER_COLOR.GREEN: preload("uid://dpgkrjm52qy5p"),
	LASER_COLOR.BLUE: preload("uid://deva2742wcn48"),
	LASER_COLOR.YELLOW: preload("uid://61mmrl58frd8"),
	LASER_COLOR.MAGENTA: preload("uid://bnqvggi85yqpt"),
	LASER_COLOR.CYAN: preload("uid://bm7w7svhg7ljv"),
	LASER_COLOR.WHITE: preload("uid://qwr10jrh8xco"),
}


## The color of this laser.
@export var color: LASER_COLOR = LASER_COLOR.NONE


func _ready() -> void:
	update_color()


## Changes the laser's length to the specified length.
func set_length(new_len: float) -> void:
	region_rect.size.x = new_len


## Changes the laser's texture.
func update_color() -> void:
	if color not in sprites:
		print("Unimplemented laser color!")
		return
	
	texture = sprites[color]


## Adds two colors together.
static func add_colors(c1: LASER_COLOR, c2: LASER_COLOR) -> LASER_COLOR:
	var c1_rgb = c1 in ColorModel.RGB.values()
	var c2_rgb = c2 in ColorModel.RGB.values()
	
	var result: LASER_COLOR = LASER_COLOR.NONE
	
	if c1_rgb and c2_rgb:
		result = ColorModel.add_rgb(
			c1 as ColorModel.RGB, c2 as ColorModel.RGB
		) as LASER_COLOR
	
	return result

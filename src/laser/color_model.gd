class_name ColorModel
extends Node
## Provides color functions for lasers.

## RGB additive colors using bitwise operators
enum RGB {
	NONE = 0,
	RED = 1,
	GREEN = 2,
	BLUE = 4,
	YELLOW = RED | GREEN,
	MAGENTA = RED | BLUE,
	CYAN = GREEN | BLUE,
	WHITE = RED | GREEN | BLUE,
}

## Adds two RGB colors together
static func add_rgb(c1: RGB, c2: RGB) -> RGB:
	return c1 | c2

extends BaseExit

@export var detector: LightDetector = null


func _ready() -> void:
	super._ready()
	
	if detector:
		detector.light_detected.connect(_on_light_detected)
		detector.light_removed.connect(_on_light_removed)


func _on_light_detected() -> void:
	enable_exit()

func _on_light_removed() -> void:
	disable_exit()

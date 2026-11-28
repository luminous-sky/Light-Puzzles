class_name BaseExit
extends Area2D

@export var start_disabled: bool = true
@export_file("*.tscn") var next_scene: String = ""

var in_teleport: bool = false


func _ready() -> void:
	if start_disabled:
		disable_exit()
	else:
		enable_exit()


func enable_exit() -> void:
	monitoring = true
	visible = true

func disable_exit() -> void:
	monitoring = false
	visible = false


func _on_body_entered(body: Node2D) -> void:
	if in_teleport or not next_scene:
		return
	
	if not body is Player:
		return
	
	in_teleport = true
	get_tree().call_deferred("change_scene_to_file", next_scene)

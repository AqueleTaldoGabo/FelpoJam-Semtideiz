extends Node

signal mudar_algo(valor)
@export var fechou = false

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().root.remove_child($".")
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		fechou = true



func _on_button_pressed() -> void:
	emit_signal("mudar_algo", 30)

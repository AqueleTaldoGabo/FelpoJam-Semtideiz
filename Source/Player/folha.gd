extends Node

signal mudar_algo(valor)

func fecha():
	
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	$".".queue_free()

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		fecha()

func _on_bt_nesquerda_pressed() -> void:
	emit_signal("mudar_algo", 20)

func _on_bt_ndireita_pressed() -> void:
	emit_signal("mudar_algo", 30)

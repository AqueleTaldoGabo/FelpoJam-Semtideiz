extends Node

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().root.remove_child($".")
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

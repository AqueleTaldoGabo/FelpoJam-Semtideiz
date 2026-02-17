extends Camera3D

@onready var camera = $"."
@export var sensibilidade_mouse = 0.002

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		camera.rotate_y(-event.relative.x * sensibilidade_mouse)
		camera.rotate_x(-event.relative.y * sensibilidade_mouse)
		camera.rotation.x = clampf(camera.rotation.x, -deg_to_rad(70), deg_to_rad(70))

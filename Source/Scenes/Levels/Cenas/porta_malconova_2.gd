extends interagivel

const portasom = preload("res://Source/Assets/Sons/portafodadestrancando.ogg")

@export var trancado = true

func _on_interagido(body: Variant) -> void:
	if !trancado:
		ControleSfx.toca_SFX(portasom)
		$'.'.hide()
		$'.'.set_collision_layer_value(1, false)

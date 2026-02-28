extends interagivel

const portasom = preload("res://Source/Assets/Sons/portafodadestrancando.ogg")

func _on_interagido(body: Variant) -> void:
	if has_node("/root/Cafeteria/Mapa/portaMALCONOVA2"):
		ControleSfx.toca_SFX(portasom)
		var porta = get_node("/root/Cafeteria/Mapa/portaMALCONOVA2")
		$".".hide()
		$".".set_collision_layer_value(1, false)
		porta.hide()
		porta.set_collision_layer_value(1, false)

extends interagivel


const escritorio = preload("res://Source/Scenes/Objects/Cenas/Escritorio.tscn")

func _on_interagido(body: Variant) -> void:
	if has_node("/root/Cafeteria/Mapa/portaMALCONOVA2"):
		var porta = get_node("/root/Cafeteria/Mapa/portaMALCONOVA2")
		porta.trancado = true
		get_tree().current_scene.add_child(escritorio.instantiate())
		$".".hide()
		$".".set_collision_layer_value(1, false)
		

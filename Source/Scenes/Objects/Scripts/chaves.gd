extends interagivel


const escritorio = preload("res://Source/Scenes/Objects/Cenas/Escritorio.tscn")

func _on_interagido(_body: Variant) -> void:
	var porta = get_node("/root/Cafeteria/Mapa/portaMALCONOVA2")
	porta.trancado = false
	get_tree().current_scene.add_child(escritorio.instantiate())
	$".".hide()
	$".".set_collision_layer_value(1, false)
		

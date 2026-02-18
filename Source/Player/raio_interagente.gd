extends RayCast3D



func _input(event: InputEvent) -> void:
	var colidindo = get_collider()
	if colidindo is interagivel and event.is_action_pressed("interagir"):
		colidindo.foiinteragido(owner)
		

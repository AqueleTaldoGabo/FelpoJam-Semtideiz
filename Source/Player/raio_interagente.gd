extends RayCast3D

@onready var lastColission

func _input(event: InputEvent) -> void:
	var colidindo = get_collider()
	if colidindo is interagivel:
		colidindo.sendo_olhado = true
		if event.is_action_pressed("interagir"):
			colidindo.foiinteragido(owner)
		lastColission = colidindo
	else:
		if lastColission != null and lastColission.sendo_olhado == true:
			lastColission.sendo_olhado = false

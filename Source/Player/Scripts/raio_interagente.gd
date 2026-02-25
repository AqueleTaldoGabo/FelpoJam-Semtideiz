extends RayCast3D

@onready var lastColission
@onready var sendo_olhado = false

func _ready() -> void:
	$".".target_position.z = $"../../..".size_raio

func _input(event: InputEvent) -> void:
	var colidindo = get_collider()
	if colidindo is interagivel:
		colidindo.foiolhado(true)
		sendo_olhado = true
		if event.is_action_pressed("interagir"):
			colidindo.foiinteragido(owner)
		lastColission = colidindo
		$"../CanvasLayer/crosshair/Label".show()
	else:
		if lastColission != null:
			lastColission.foiolhado(false)
		$"../CanvasLayer/crosshair/Label".hide()

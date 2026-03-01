extends interagivel

const portasom = preload("res://Source/Assets/Sons/portafodadestrancando.ogg")
const malgino = preload("res://Source/Assets/Sons/REVELACAODOMAL2.ogg")

@export var trancado = true
@export var vermelho = false

func _on_interagido(body: Variant) -> void:
	if !trancado:
		ControleSfx.toca_SFX(portasom)
		if vermelho:
			ControleSfx.toca_SFX(malgino)
		$'.'.hide()
		$'.'.set_collision_layer_value(1, false)

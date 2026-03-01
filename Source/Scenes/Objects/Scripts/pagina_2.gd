extends Control

const porta = preload("res://Source/Assets/Sons/portaabrindo.ogg")
const demitido = preload("res://Source/Assets/Imagens/cartadedemissaoending.png")


func _on_texture_button_pressed() -> void:
	ControleSfx.toca_Carimbo1()
	MudarScena.mudarFinal(2)


func _on_texture_button_4_pressed() -> void:
	ControleSfx.toca_Carimbo1()
	await get_tree().create_timer(0.3).timeout
	$".".hide()
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	

extends Control

const porta = preload("res://Source/Assets/Sons/portaabrindo.ogg")
const demitido = preload("res://Source/Assets/Imagens/cartadedemissaoending.png")


func _on_texture_button_pressed() -> void:
	MudarScena.mudarFinal(2)


func _on_texture_button_4_pressed() -> void:
	MudarScena.mudarFinal(3)
	

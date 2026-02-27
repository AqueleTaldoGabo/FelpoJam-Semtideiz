extends Control

const porta = preload("res://Source/Assets/Sons/portaabrindo.ogg")
const demitido = preload("res://Source/Assets/Imagens/cartadedemissaoending.png")


func _on_texture_button_pressed() -> void:
	Transicao.transicao()
	await Transicao.fade_acabou
	$".".hide()
	$"../Pagina1".show()
	$"../Pagina1/MoldeDaCartaTutorial".texture = demitido


func _on_texture_button_4_pressed() -> void:
	MudarScena.mudarMenu2()
	await get_tree().create_timer(1.5).timeout
	ControleSfx.toca_SFX(porta)
	

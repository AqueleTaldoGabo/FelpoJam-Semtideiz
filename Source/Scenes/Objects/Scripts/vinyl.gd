extends interagivel

@export var ligado = true

func _on_interagido(_body: Variant) -> void:
	if ligado == true:
		ControleMusica.pausa_musica()
		ControleSfx.toca_Botao()
		ligado = false
	else:
		ControleSfx.toca_Botao()
		ControleMusica.play_musica()
		ligado = true


func _on_olhado(_bolean: Variant) -> void:
	pass # Replace with function body.


func _on_porta_malconova_2_interagido(body: Variant) -> void:
	pass # Replace with function body.

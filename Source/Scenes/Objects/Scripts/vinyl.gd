extends interagivel

@export var ligado = true

func _on_interagido(_body: Variant) -> void:
	if ligado == true:
		ControleMusica.pausa_musica()
		ligado = false
	else:
		ControleMusica.play_musica()
		ligado = true


func _on_olhado(_bolean: Variant) -> void:
	pass # Replace with function body.

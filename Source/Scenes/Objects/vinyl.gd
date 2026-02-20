extends interagivel

@export var ligado = true

func _on_interagido(body: Variant) -> void:
	if ligado == true:
		ControleMusica.pausa_musica()
		ligado = false
	else:
		ControleMusica.play_musica()
		ligado = true

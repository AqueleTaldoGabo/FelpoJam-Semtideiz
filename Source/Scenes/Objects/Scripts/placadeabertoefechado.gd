extends interagivel

const musica = preload("res://Source/Assets/Música/loop1gameplaycerto.ogg")

var saida = false
var quant_ver

func _on_interagido(_body: Variant) -> void:
	if saida == true:
		
		MudarScena.mudarFim(quant_ver)
	if !has_node("/root/Folha"):
		Transicao.transicao()
		await Transicao.fade_acabou
		ControleMusica.trocar_musica(musica)
		var player_pos = get_node("/root/Cafeteria/Player")
		player_pos.global_position = Vector3(3.891, 0.386, -0.039)
	

func _on_olhado(_bolean: Variant) -> void:
	pass # Replace with function body.

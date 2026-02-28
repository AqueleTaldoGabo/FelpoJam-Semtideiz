extends interagivel

var saida = false
var quant_ver

func _on_interagido(_body: Variant) -> void:
	if saida:
		var cena1 = get_tree().current_scene
		quant_ver = cena1.cont_vermelho
		MudarScena.mudarFim(quant_ver)
	else:
		if !has_node("/root/Folha"):
			Transicao.transicao()
			await Transicao.fade_acabou
			var player_pos = get_node("/root/Cafeteria/Player")
			player_pos.global_position = Vector3(3.891, 0.386, -0.039)
	

func _on_olhado(_bolean: Variant) -> void:
	pass # Replace with function body.

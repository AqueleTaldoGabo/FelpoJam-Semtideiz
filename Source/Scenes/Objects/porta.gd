extends interagivel

var MUSICA1 = preload("res://Source/Música/temadocari.ogg")

func _on_interagido(body: Variant) -> void:
	Transicao.transicao()
	ControleMusica.fade_out()
	await Transicao.fade_acabou
	ControleMusica.trocar_musica(MUSICA1)
	get_tree().change_scene_to_file("res://Source/Scenes/Levels/Menu.tscn")
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func _process(delta: float) -> void:
	if !sendo_olhado:
		$portaMALCONOVA2/SpotLight3D.show()
	else:
		$portaMALCONOVA2/SpotLight3D.hide()

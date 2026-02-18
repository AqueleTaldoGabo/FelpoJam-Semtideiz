extends interagivel

var MUSICA1 = preload("res://Source/Música/temadocari.ogg")

func _on_interagido(body: Variant) -> void:
	var cur_scene = get_tree().get_current_scene()
	print(cur_scene)
	Transicao.transicao()
	ControleMusica.fade_out()
	await Transicao.fade_acabou
	ControleMusica.trocar_musica(MUSICA1)
	get_tree().change_scene_to_file("res://Source/Scenes/Levels/Menu.tscn")
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

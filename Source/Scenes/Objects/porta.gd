extends interagivel

var MAIN = preload("res://Source/Scenes/Levels/Menu.tscn").instantiate()
var MUSICA1 = preload("res://Source/Música/temadocari.ogg")

func _on_interagido(body: Variant) -> void:
	var cur_scene = get_tree().get_current_scene()
	print(cur_scene)
	Transicao.transicao()
	ControleMusica.fade_out()
	await Transicao.fade_acabou
	ControleMusica.trocar_musica(MUSICA1)
	get_tree().root.add_child(MAIN)
	get_tree().root.remove_child(cur_scene)

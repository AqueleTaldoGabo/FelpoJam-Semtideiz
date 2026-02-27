extends Node

const whitenoise = preload("res://Source/Assets/Música/whitenoise.ogg")

var mapa = preload("res://Source/Scenes/Levels/Cenas/mapa.tscn")
var cafe = preload("res://Source/Scenes/Objects/Cenas/Canecas.tscn")
var cardboard = preload("res://Source/Scenes/Objects/Cenas/CardBoard.tscn")



func _on_mudar_algo(valor, valor2):
	$Player._adjacency_matrix_player = valor2
	if valor == 6:
		if !has_node("/root/Cafeteria/Mapa"):
			get_tree().current_scene.add_child(mapa.instantiate())
	elif valor == 7:
		if !has_node("/root/Cafeteria/CardBoard"):
			get_tree().current_scene.add_child(cardboard.instantiate())
	elif valor == -7:
		if has_node("/root/Cafeteria/CardBoard"):
			var noode = get_node("/root/Cafeteria/CardBoard")
			noode.queue_free()
	elif valor == 20:
		if !has_node("/root/Cafeteria/Canecas"):
			get_tree().current_scene.add_child(cafe.instantiate())
	
			
			ControleMusica.trocar_musica(whitenoise)
	if valor < 5 and valor >= 0:
		$Player.folhas = valor

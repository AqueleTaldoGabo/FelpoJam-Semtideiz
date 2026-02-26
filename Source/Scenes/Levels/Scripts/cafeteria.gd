extends Node

const whitenoise = preload("res://Source/Assets/Música/whitenoise.ogg")

var mapa = preload("res://Source/Scenes/Levels/Cenas/mapa.tscn")
var cafe = preload("res://Source/Scenes/Objects/Cenas/Canecas.tscn")



func _on_mudar_algo(valor, valor2):
	$Player._adjacency_matrix_player = valor2
	if valor == 20:
		if !has_node("/root/Cafeteria/Canecas"):
			get_tree().current_scene.add_child(cafe.instantiate())
	if valor == 30:
		if !has_node("/root/Cafeteria/Mapa"):
			get_tree().current_scene.add_child(mapa.instantiate())
			
			ControleMusica.trocar_musica(whitenoise)
	if valor < 10:
		$Player.folhas = valor

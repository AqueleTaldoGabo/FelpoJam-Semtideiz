extends Node

@onready var ANIMATED_LABEL = $"Player/Cabeça/Camera3D/CanvasLayer/Label"

const whitenoise = preload("res://Source/Assets/Música/whitenoise.ogg")


var secret = false
var current_text: String = ""
var abrido = false

var cont_vermelho = [false, false, false]
var carimbas = [false, false, false, false, false, false, false, false, false]

var mapa = preload("res://Source/Scenes/Levels/Cenas/mapa.tscn")
var cafe = preload("res://Source/Scenes/Objects/Cenas/Canecas.tscn")
var cardboard = preload("res://Source/Scenes/Objects/Cenas/CardBoard.tscn")

#if carimbas.count(true) == 9:


func animar_texto(textos):
	for frase in textos:
		if abrido == true:
			break
		for letra in frase:
			if abrido == true:
				break
			while get_tree().paused:
				await get_tree().process_frame
			if get_tree().paused == false:
				current_text += letra
				ANIMATED_LABEL.text = current_text
				await get_tree().create_timer(0.05).timeout
		while get_tree().paused:
			await get_tree().process_frame
		await get_tree().create_timer(0.9).timeout
		current_text = ""

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("abrir_pagina"):
		abrido = true

func _ready() -> void:
	await get_tree().create_timer(2).timeout
	await animar_texto(["Aperte espaço para abrir a pasta"])

func _on_mudar_algo(valor, valor2):
	$Player._adjacency_matrix_player = valor2
	if valor == 6:
		if !has_node("/root/Cafeteria/Mapa"):
			if carimbas[0] == false:
				carimbas[0] = true
			get_tree().current_scene.add_child(mapa.instantiate())
	elif valor == 7:
		if carimbas[1] == false:
				carimbas[1] = true
		if cont_vermelho[0] == false:
				cont_vermelho[0] = true
		if !has_node("/root/Cafeteria/CardBoard"):
			get_tree().current_scene.add_child(cardboard.instantiate())
	elif valor == -7:
		if carimbas[1] == false:
				carimbas[1] = true
		if cont_vermelho[0] == true:
				cont_vermelho[0] = false
		if has_node("/root/Cafeteria/CardBoard"):
			var noode = get_node("/root/Cafeteria/CardBoard")
			noode.queue_free()
	elif valor == 20:
		if !has_node("/root/Cafeteria/Canecas"):
			get_tree().current_scene.add_child(cafe.instantiate())
			ControleMusica.trocar_musica(whitenoise)
	elif valor == 88:
		secret = true

	if valor < 5 and valor >= 0:
		$Player.folhas = valor

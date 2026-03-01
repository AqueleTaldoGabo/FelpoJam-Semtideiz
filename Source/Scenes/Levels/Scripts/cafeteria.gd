extends Node

@onready var ANIMATED_LABEL = $"Player/Cabeça/Camera3D/CanvasLayer/Label"
@export var corporum = false


const whitenoise = preload("res://Source/Assets/Música/whitenoise.ogg")
const classico = preload("res://Source/Assets/Sons/carimbagemclassica1.ogg")
const conversa = preload("res://Source/Assets/Sons/gibberishdequalidade.ogg")
const musica2 = preload("res://Source/Assets/Música/loopgameplay2.ogg")
const musica3 = preload("res://Source/Assets/Música/loopfinal.ogg")

var secret = false
var current_text: String = ""
var abrido = false
var ativo1 = false
var ativo2 = false
var vermelho = false
var texto = false

var placa
var cont_vermelho = [false, false, false]
var carimbas = [false, false, false, false, false, false, false, false, false]

var mapa = preload("res://Source/Scenes/Levels/Cenas/mapa.tscn")
var cafe = preload("res://Source/Scenes/Objects/Cenas/Canecas.tscn")
var cardboard = preload("res://Source/Scenes/Objects/Cenas/CardBoard.tscn")
var placaentrada = preload("res://Source/Scenes/Objects/Cenas/PlacaCapacitacao.tscn")
var descarte = preload("res://Source/Scenes/Objects/Cenas/Descarte.tscn")
var postit = preload("res://Source/Scenes/Objects/Cenas/Postit.tscn")
var postit2 = preload("res://Source/Scenes/Objects/Cenas/PostIt2.tscn")
var terminal = preload("res://Source/Scenes/Objects/Cenas/Terminal.tscn")
var corpoprofi = preload("res://Source/Scenes/Objects/Cenas/CorpoProfissional.tscn")
var corpo = preload("res://Source/Scenes/Objects/Cenas/Corpo.tscn")

func animar_texto(textos):
	current_text = ""
	for frase in textos:
		for letra in frase:
			if abrido == true:
				return
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
			carimbada(0)
			get_tree().current_scene.add_child(mapa.instantiate())
			$AudioStreamPlayer.play()
	elif valor == 7:
		carimbada(1)
		if cont_vermelho[0] == false:
				cont_vermelho[0] = true
		if !has_node("/root/Cafeteria/CardBoard"):
			get_tree().current_scene.add_child(cardboard.instantiate())
	elif valor == -7:
		carimbada(1)
		if cont_vermelho[0] == true:
				cont_vermelho[0] = false
		if has_node("/root/Cafeteria/CardBoard"):
			var noode = get_node("/root/Cafeteria/CardBoard")
			noode.queue_free()
	elif valor == 8:
		carimbada(2)
		if !has_node("/root/Cafeteria/PlacaCapacitacao"):
			placa = placaentrada.instantiate()
			await get_tree().create_timer(0.1).timeout
			get_tree().current_scene.add_child(placa)
			

	elif valor == -8:
		carimbada(2)
		if has_node("/root/Cafeteria/PlacaCapacitacao"):
			placa.queue_free()
			placa = null
	elif valor == 9:
		carimbada(3)
		if !has_node("/root/Cafeteria/Canecas"):
			get_tree().current_scene.add_child(cafe.instantiate())
	elif valor == -9:
		carimbada(3)
		if has_node("/root/Cafeteria/Canecas"):
			var noode = get_node("/root/Cafeteria/Canecas")
			noode.queue_free()
	elif valor == 10:
		carimbada(4)
		if !has_node("/root/Cafeteria/Descarte"):
			if has_node("/root/Cafeteria/Mapa/portaMALCONOVA3"):
				var porta = get_node("/root/Cafeteria/Mapa/portaMALCONOVA3")
				porta.hide()
				porta.set_collision_layer_value(1, false)
				await get_tree().create_timer(0.1).timeout
			get_tree().current_scene.add_child(descarte.instantiate())
			
	elif valor == -10:
		carimbada(4)
		if has_node("/root/Cafeteria/Descarte"):
			var noode = get_node("/root/Cafeteria/Descarte")
			if has_node("/root/Cafeteria/Mapa/portaMALCONOVA3"):
				var porta = get_node("/root/Cafeteria/Mapa/portaMALCONOVA3")
				porta.show()
				porta.set_collision_layer_value(1, true)
			noode.queue_free()
	elif valor == 11:
		carimbada(5)
		if cont_vermelho[1] == false:
				cont_vermelho[1] = true
		if !has_node("/root/Cafeteria/Postit"):
			get_tree().current_scene.add_child(postit.instantiate())
			ControleSfx.toca_SFX(classico)
	elif valor == -11:
		carimbada(5)
		if cont_vermelho[1] == true:
				cont_vermelho[1] = false
		if has_node("/root/Cafeteria/Postit"):
			var noode = get_node("/root/Cafeteria/Postit")
			noode.queue_free()
	elif valor == 12:
		carimbada(6)
		if !has_node("/root/Cafeteria/CorpoProfissional"):
			get_tree().current_scene.add_child(corpoprofi.instantiate())
	elif valor == -12:
		carimbada(6)
		if has_node("/root/Cafeteria/CorpoProfissional"):
			var noode = get_node("/root/Cafeteria/CorpoProfissional")
			noode.queue_free()
	elif valor == 13:
		carimbada(7)
		if cont_vermelho[2] == false:
				cont_vermelho[2] = true
		if !has_node("/root/Cafeteria/PostIt2"):
			get_tree().current_scene.add_child(postit2.instantiate())
	elif valor == -13:
		carimbada(7)
		if cont_vermelho[2] == true:
				cont_vermelho[2] = false
		if has_node("/root/Cafeteria/PostIt2"):
			var noode = get_node("/root/Cafeteria/PostIt2")
			noode.queue_free()
	
	elif valor == 14:
		carimbada(8)
		
		if !has_node("/root/Cafeteria/Terminal"):
			get_tree().current_scene.add_child(terminal.instantiate())

	elif valor == -14:
		carimbada(8)
		
		if has_node("/root/Cafeteria/Terminal"):
			var noode = get_node("/root/Cafeteria/Terminal")
			noode.queue_free()
		
	if valor == 88:
		secret = true
		$Player.vermelho = false
		$Player.segredo = true
		if !has_node("/root/Cafeteria/Corpo"):
			get_tree().current_scene.add_child(corpo.instantiate())
		
	if carimbas.count(true) == 6 and !ativo1:
		ControleMusica.trocar_com_fade(musica2)
		ativo1 = true
	if carimbas.count(true) == 9 and !ativo2:
		ControleMusica.trocar_com_fade(musica3)
		ativo2 = true
	
	if checker2() and secret == false and checker():
		await get_node("/root/Folha").tree_exited
		abrido = false
		$Player.vermelho = true
		if vermelho:
			animar_texto(["Volte as folhas"])
			vermelho = false

	else:
		saida()
	if valor < 5 and valor >= 0:
		$Player.folhas = valor

func carimbada(algo):
	carimbas[algo] = true
	
func checker2():
	if !vermelho and cont_vermelho.count(true):
		vermelho = true
	return cont_vermelho.count(true) == 3
	

func checker():
	if carimbas.count(true) == 9 and !texto:
		texto = true
	return carimbas.count(true) == 9
	
func saida():

	if checker() and (corporum or cont_vermelho.count(true) != 3) :
		await get_node("/root/Folha").tree_exited
		
		if has_node("/root/Cafeteria/PlacaCapacitacao"):
			var porta = get_node("/root/Cafeteria/PlacaCapacitacao")
			porta.saida = true
			porta.quant_ver = cont_vermelho
		abrido = false

		if texto:
			animar_texto(["Saia da cafeteria"])
			texto = false

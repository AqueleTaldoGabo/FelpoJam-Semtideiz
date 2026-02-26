extends Node

signal mudar_algo(valor, valor2)

@export var folha = 2
const FUNDO1 = preload("res://Source/Assets/Sprites/Documentos sem seta.png")
const FUNDO2 = preload("res://Source/Assets/Sprites/Documaneo_com_ouitro_papel.png")

var folhas = [preload("res://Source/Assets/Imagens/MOLDE_DA_CARTA_TUTORIAL.png"),
			preload("res://Source/Assets/Imagens/mocadesaparecida.png"),
			preload("res://Source/Assets/Imagens/DOCUMENTOSCARIMBO1.png")]
			
var botao = preload("res://Source/Assets/Sprites/Jogar.png")
var botao2 = preload("res://Source/Assets/Sprites/Sair.png")
var _adjacency_matrix = [
	{ "esq": botao, "dir": botao },
	{ "esq": botao, "dir": botao },
	{ "esq": botao, "dir": botao }
]

var btn1 = 0
var btn2 = 0


func fecha():
	var crosshair = get_node("/root/Cafeteria/Player/Cabeça/Camera3D/CanvasLayer/crosshair")
	if folha > 1:
			_adjacency_matrix[folha-2]["esq"] = $Control/HBoxContainer/BTNesquerda.texture_normal
			_adjacency_matrix[folha-2]["dir"] = $Control/HBoxContainer/BTNdireita.texture_normal
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	ControleSfx.toca_Papel()
	crosshair.show()
	if btn1 != 0:
		emit_signal("mudar_algo", btn1, _adjacency_matrix)
	if btn2 != 0:
		emit_signal("mudar_algo", 30, _adjacency_matrix)
	$".".queue_free()

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func mudarPag():
	$Control/Documentoscarimbo1.texture = folhas[folha]
	if folha == 0:
		$Control/DossierInteiro.texture = FUNDO1
	else:
		$Control/DossierInteiro.texture = FUNDO2
	if folha < 2 : 
		$Control/HBoxContainer/BTNesquerda.hide()
		$Control/HBoxContainer/BTNdireita.hide()
	else:
		$Control/HBoxContainer/BTNesquerda.show()
		$Control/HBoxContainer/BTNdireita.show()
		$Control/HBoxContainer/BTNesquerda.texture_normal = _adjacency_matrix[folha-2]["esq"]
		$Control/HBoxContainer/BTNdireita.texture_normal = _adjacency_matrix[folha-2]["dir"]
	emit_signal("mudar_algo", folha, _adjacency_matrix)
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		
		fecha()
	if event.is_action_pressed("abrir_pagina"):
		fecha() 
	if event.is_action_pressed("interagir"):
		ControleSfx.toca_Carimbo1()

func _on_bt_nesquerda_pressed() -> void:
	$Control/HBoxContainer/BTNesquerda.texture_normal = botao2
	$Control/HBoxContainer/BTNdireita.texture_normal = botao
	btn1=20

func _on_bt_ndireita_pressed() -> void:
	$Control/HBoxContainer/BTNdireita.texture_normal = botao2
	$Control/HBoxContainer/BTNesquerda.texture_normal = botao
	btn2=30

func _on_button_pressed() -> void:
	if folha > 0:
		if folha > 1:
			_adjacency_matrix[folha-2]["esq"] = $Control/HBoxContainer/BTNesquerda.texture_normal
			_adjacency_matrix[folha-2]["dir"] = $Control/HBoxContainer/BTNdireita.texture_normal
		folha = folha-1
	mudarPag()


func _on_avançar_pressed() -> void:
	
	if folha < 10:
		if folha > 1:
			_adjacency_matrix[folha-2]["esq"] = $Control/HBoxContainer/BTNesquerda.texture_normal
			_adjacency_matrix[folha-2]["dir"] = $Control/HBoxContainer/BTNdireita.texture_normal
		folha = folha+1
	mudarPag()

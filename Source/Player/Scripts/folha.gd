extends Node

signal mudar_algo(valor, valor2)

@export var folha = 2
const FUNDO1 = preload("res://Source/Assets/Sprites/Documentos sem seta.png")
const FUNDO2 = preload("res://Source/Assets/Sprites/Documaneo_com_ouitro_papel.png")

var folhas = [preload("res://Source/Assets/Imagens/MOLDE_DA_CARTA_TUTORIAL.png"),
			preload("res://Source/Assets/Imagens/mocadesaparecida.png"),
			preload("res://Source/Assets/Imagens/DOCUMENTOSCARIMBO1.png"),
			preload("res://Source/Assets/Imagens/DOCUMENTOSCARIMBO2dither.png"),
			preload("res://Source/Assets/Imagens/DOCUMENTOSCARIMBO3dithe.png")]

var botaodesligado = [preload("res://Source/Assets/Sprites/Não apagado.png"), preload("res://Source/Assets/Sprites/Sim apagado.png")]
var botaoligado = [preload("res://Source/Assets/Sprites/Nãoligado.png"), preload("res://Source/Assets/Sprites/Sim ligado.png")]

var _adjacency_matrix = [
	{ "esq1": botaodesligado[0], "dir1": botaodesligado[1], "esq2": botaodesligado[0], "dir2": botaodesligado[1], "esq3": botaodesligado[0], "dir3": botaodesligado[1]},
	{ "esq1": botaodesligado[0], "dir1": botaodesligado[1], "esq2": botaodesligado[0], "dir2": botaodesligado[1], "esq3": botaodesligado[0], "dir3": botaodesligado[1]},
	{ "esq1": botaodesligado[0], "dir1": botaodesligado[1], "esq2": botaodesligado[0], "dir2": botaodesligado[1], "esq3": botaodesligado[0], "dir3": botaodesligado[1]}
]

var btn1 = 0
var btn2 = 0
var btn3 = 0

var marcado = false

func fecha():
	var crosshair = get_node("/root/Cafeteria/Player/Cabeça/Camera3D/CanvasLayer/crosshair")
	if folha > 1:
		for i in range(3):
			var btn_esq = get_node("Control/HboxCont" + str(i+1) + "/BTNesquerda1")
			var btn_dir = get_node("Control/HboxCont" + str(i+1) + "/BTNdireita1" )
			_adjacency_matrix[folha-2]["esq" + str(i+1)] = btn_esq.texture_normal
			_adjacency_matrix[folha-2]["dir" + str(i+1)] = btn_dir.texture_normal
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	ControleSfx.toca_Papel()
	crosshair.show()
	if btn1 != 0:
		emit_signal("mudar_algo", btn1, _adjacency_matrix)
	if btn2 != 0:
		emit_signal("mudar_algo", btn2, _adjacency_matrix)
	if btn3 != 0:
		emit_signal("mudar_algo", btn3, _adjacency_matrix)
	emit_signal("mudar_algo", folha, _adjacency_matrix)
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
		for i in range(3):
			var btn_esq = get_node("Control/HboxCont" + str(i+1) + "/BTNesquerda1")
			var btn_dir = get_node("Control/HboxCont" + str(i+1) + "/BTNdireita1" )
			btn_esq.hide()
			btn_dir.hide()
	else:
		for i in range(3):
			var btn_esq = get_node("Control/HboxCont" + str(i+1) + "/BTNesquerda1")
			var btn_dir = get_node("Control/HboxCont" + str(i+1) + "/BTNdireita1" )
			btn_esq.show()
			btn_dir.show()
			btn_esq.texture_normal = _adjacency_matrix[folha-2]["esq" + str(i+1)]
			btn_dir.texture_normal = _adjacency_matrix[folha-2]["dir" + str(i+1)]
	

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		fecha()
	if event.is_action_pressed("abrir_pagina"):
		fecha() 
	if event.is_action_pressed("interagir"):
		ControleSfx.toca_Carimbo1()

func _on_button_pressed() -> void:
	$"Control/Avançar".show()
	if folha > 0:
		if folha > 1:
			for i in range(3):
				var btn_esq = get_node("Control/HboxCont" + str(i+1) + "/BTNesquerda1")
				var btn_dir = get_node("Control/HboxCont" + str(i+1) + "/BTNdireita1" )
				_adjacency_matrix[folha-2]["esq" + str(i+1)] = btn_esq.texture_normal
				_adjacency_matrix[folha-2]["dir" + str(i+1)] = btn_dir.texture_normal

		folha = folha-1
		if folha == 0:
			$"Control/Voltar".hide()
	mudarPag()


func _on_avançar_pressed() -> void:
	$"Control/Voltar".show()
	if folha < 4:
		if folha > 1:
			for i in range(3):
				var btn_esq = get_node("Control/HboxCont" + str(i+1) + "/BTNesquerda1")
				var btn_dir = get_node("Control/HboxCont" + str(i+1) + "/BTNdireita1" )
				_adjacency_matrix[folha-2]["esq" + str(i+1)] = btn_esq.texture_normal
				_adjacency_matrix[folha-2]["dir" + str(i+1)] = btn_dir.texture_normal

		folha = folha+1
		if folha == 4:
			$"Control/Avançar".hide()
	mudarPag()


func _on_bt_nesquerda_1_pressed() -> void:
	if !marcado or folha != 2:
		$Control/HboxCont1/BTNesquerda1.texture_normal = botaoligado[0]
		$Control/HboxCont1/BTNdireita1.texture_normal = botaodesligado[1]
		btn1 = ((folha)*3)*(-1)


func _on_bt_ndireita_1_pressed() -> void:
	$Control/HboxCont1/BTNesquerda1.texture_normal = botaodesligado[0]
	$Control/HboxCont1/BTNdireita1.texture_normal = botaoligado[1]
	if folha == 2:
		marcado = true
	btn1 = (folha*3)

func _on_bt_nesquerda_2_pressed() -> void:
	$Control/HboxCont2/BTNesquerda1.texture_normal = botaoligado[0]
	$Control/HboxCont2/BTNdireita1.texture_normal = botaodesligado[1]
	btn2 = (folha*3 + 1)*(-1)
	print(btn2)

func _on_bt_ndireita_2_pressed() -> void:
	$Control/HboxCont2/BTNesquerda1.texture_normal = botaodesligado[0]
	$Control/HboxCont2/BTNdireita1.texture_normal = botaoligado[1]
	btn2 = (folha*3 + 1)
	print(btn2)

func _on_bt_nesquerda_3_pressed() -> void:
	$Control/HboxCont3/BTNesquerda1.texture_normal = botaoligado[0]
	$Control/HboxCont3/BTNdireita1.texture_normal = botaodesligado[1]
	btn3 = (folha*3 + 2)*(-1)
	print(btn3)

func _on_bt_ndireita_3_pressed() -> void:
	$Control/HboxCont3/BTNesquerda1.texture_normal = botaodesligado[0]
	$Control/HboxCont3/BTNdireita1.texture_normal = botaoligado[1]
	btn3 = (folha*3 + 2)
	print(btn3)

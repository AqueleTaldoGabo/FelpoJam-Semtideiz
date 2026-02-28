extends Node

signal mudar_algo(valor, valor2)

@export var vermelho = false
@export var folha = 2
@export var comeco = false

const FUNDO1 = preload("res://Source/Assets/Sprites/Documentos sem seta.png")
const FUNDO2 = preload("res://Source/Assets/Sprites/Documaneo_com_ouitro_papel.png")
const coracao1 = preload("res://Source/Assets/Sons/batidanormal.ogg")
const coracao2 = preload("res://Source/Assets/Sons/batida do coraçãoacelerado.ogg")
const coracao3 = preload("res://Source/Assets/Sons/CORACAORAPIDODEMAIS.ogg")

var folhas = [preload("res://Source/Assets/Imagens/MOLDE_DA_CARTA_TUTORIAL.png"),
			preload("res://Source/Assets/Imagens/mocadesaparecida.png"),
			preload("res://Source/Assets/Imagens/DOCUMENTOSCARIMBO1.png"),
			preload("res://Source/Assets/Imagens/DOCUMENTOSCARIMBO2dither.png"),
			preload("res://Source/Assets/Imagens/DOCUMENTOSCARIMBO3dithe.png")]

var ligado = false

var botaodesligado = preload("res://Source/Assets/Sprites/Selo confirmado transparente.png")
var botaoligado = [preload("res://Source/Assets/Sprites/Selo confirmado vermelh on.png"), preload("res://Source/Assets/Sprites/Selo confirmado verde onn.png")]

var _adjacency_matrix = [
	{ "esq1": botaodesligado, "dir1": botaodesligado, "esq2": botaodesligado, "dir2": botaodesligado, "esq3": botaodesligado, "dir3": botaodesligado},
	{ "esq1": botaodesligado, "dir1": botaodesligado, "esq2": botaodesligado, "dir2": botaodesligado, "esq3": botaodesligado, "dir3": botaodesligado},
	{ "esq1": botaodesligado, "dir1": botaodesligado, "esq2": botaodesligado, "dir2": botaodesligado, "esq3": botaodesligado, "dir3": botaodesligado}
]

var btn1 = [null, null, null]
var btn2 = [null, null, null]
var btn3 = [null, null, null]

var marcado = false
		

func fecha():
	if !vermelho or comeco:
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
		emit_signal("mudar_algo", folha, _adjacency_matrix)
		$".".queue_free()

func _ready() -> void:
	if vermelho and !comeco:
		ControleSfx.toca_SFX(coracao1)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func mudarPag():
	if folha == 4:
		$"Control/Avançar".hide()
	if vermelho:
			folhas[1] = preload("res://Source/Assets/Imagens/progressao3.png")
			folhas[4] = preload("res://Source/Assets/Imagens/DOCUMENTO3REVELADODITHER.png")
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
		if !vermelho or comeco:
			ControleSfx.toca_Carimbo1()

func _on_button_pressed() -> void:
	if !vermelho or comeco:
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
	else:
		if !ligado:
			$Timer.start()
			ligado = true
		if $Timer.time_left <= 0:
			if ControleSfx.stream == coracao1:
				ControleSfx.toca_SFX(coracao2)
			else:
				ControleSfx.toca_SFX(coracao3)
			folha = folha-1
			$Timer.start()
		if folha == 1:
			
			$Control/Voltar.hide()
		mudarPag()


func _on_avançar_pressed() -> void:
	$"Control/Voltar".show()
	if folha < 4:
		var deu_certo = true
		if !vermelho or comeco:
			if folha > 1:
				for i in range(3):
					var btn_esq = get_node("Control/HboxCont" + str(i+1) + "/BTNesquerda1")
					var btn_dir = get_node("Control/HboxCont" + str(i+1) + "/BTNdireita1" )
					_adjacency_matrix[folha-2]["esq" + str(i+1)] = btn_esq.texture_normal
					_adjacency_matrix[folha-2]["dir" + str(i+1)] = btn_dir.texture_normal
					if btn_esq.texture_normal == botaodesligado and btn_dir.texture_normal == botaodesligado:
						print("puts")
						deu_certo = false
		
			if deu_certo:
				folha = folha+1
			if folha == 4:
				$"Control/Avançar".hide()
	mudarPag()


func _on_bt_nesquerda_1_pressed() -> void:
	if !marcado or folha != 2:
		$Control/HboxCont1/BTNesquerda1.texture_normal = botaoligado[0]
		$Control/HboxCont1/BTNdireita1.texture_normal = botaodesligado
		btn1[folha-2] = ((folha)*3)*(-1)
		emit_signal("mudar_algo", btn1[folha-2], _adjacency_matrix)



func _on_bt_ndireita_1_pressed() -> void:
	$Control/HboxCont1/BTNesquerda1.texture_normal = botaodesligado
	$Control/HboxCont1/BTNdireita1.texture_normal = botaoligado[1]
	if folha == 2:
		marcado = true
	btn1[folha-2] = (folha*3)
	emit_signal("mudar_algo", btn1[folha-2], _adjacency_matrix)

func _on_bt_nesquerda_2_pressed() -> void:
	$Control/HboxCont2/BTNesquerda1.texture_normal = botaoligado[0]
	$Control/HboxCont2/BTNdireita1.texture_normal = botaodesligado
	btn2[folha-2] = (folha*3 + 1)*(-1)
	emit_signal("mudar_algo", btn2[folha-2], _adjacency_matrix)


func _on_bt_ndireita_2_pressed() -> void:
	$Control/HboxCont2/BTNesquerda1.texture_normal = botaodesligado
	$Control/HboxCont2/BTNdireita1.texture_normal = botaoligado[1]
	btn2[folha-2] = (folha*3 + 1)
	emit_signal("mudar_algo", btn2[folha-2], _adjacency_matrix)

func _on_bt_nesquerda_3_pressed() -> void:
	$Control/HboxCont3/BTNesquerda1.texture_normal = botaoligado[0]
	$Control/HboxCont3/BTNdireita1.texture_normal = botaodesligado
	btn3[folha-2] = (folha*3 + 2)*(-1)
	emit_signal("mudar_algo", btn3[folha-2], _adjacency_matrix)

func _on_bt_ndireita_3_pressed() -> void:
	$Control/HboxCont3/BTNesquerda1.texture_normal = botaodesligado
	$Control/HboxCont3/BTNdireita1.texture_normal = botaoligado[1]
	btn3[folha-2] = (folha*3 + 2)
	emit_signal("mudar_algo", btn3[folha-2], _adjacency_matrix)


func _on_secret_pressed() -> void:
	if folha == 1:
		emit_signal("mudar_algo", 88, _adjacency_matrix)
		comeco = true
		var porta = get_node("/root/Cafeteria/Mapa/portaMALCONOVA2")
		porta.show()
		porta
		porta.set_collision_layer_value(1, true)

		

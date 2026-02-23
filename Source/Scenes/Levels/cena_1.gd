extends Node

var MUSICA1 = preload("res://Source/Música/temadocari.ogg")

@onready var ANIMATED_LABEL = $"Player/Cabeça/Camera3D/CanvasLayer/Label"

var frases = 	["Alô alôoou, ...", 
				"então funcionário…", 
				"O  pessoal do departamento mandou uma mensagem",
 				"sobre as instruções do trabalho, ...",
				"não é muito diferente do que você já tava acostumado,",
				"mas protocolo é protocolo, sabe como é né."]

var current_text: String = ""
var texto = true


func animar_texto():
	for frase in frases:
		for letra in frase:
			current_text += letra
			ANIMATED_LABEL.text = current_text
			print(ANIMATED_LABEL)
			await get_tree().create_timer(0.05).timeout
		await get_tree().create_timer(0.9).timeout
		current_text = ""


func _on_telefone_interagido(body: Variant) -> void:
	if texto:
		texto = !texto
		await animar_texto()
		ANIMATED_LABEL.text = ""


func _on_porta_interagido(body: Variant) -> void:
	Transicao.transicao()
	ControleMusica.fade_out()
	await Transicao.fade_acabou
	get_tree().change_scene_to_file("res://Source/Scenes/Levels/Cafeteria.tscn")
	ControleMusica.trocar_musica(MUSICA1)

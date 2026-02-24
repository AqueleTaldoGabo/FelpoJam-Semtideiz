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


func animar_texto(textos):
	for frase in textos:
		for letra in frase:
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


func _on_telefone_interagido(body: Variant) -> void:
	if texto:
		texto = !texto
		await animar_texto(frases)
		ANIMATED_LABEL.text = ""
		await get_tree().create_timer(0.4).timeout
		await animar_texto(["Analise a pasta"])
		


func _on_porta_interagido(body: Variant) -> void:
	Transicao.transicao()
	ControleMusica.fade_out()
	await Transicao.fade_acabou
	get_tree().change_scene_to_file("res://Source/Scenes/Levels/Cafeteria.tscn")
	ControleMusica.trocar_musica(MUSICA1)


func _on_pasta_interagido(body: Variant) -> void:
	ANIMATED_LABEL.hide()
	$Pasta.hide()

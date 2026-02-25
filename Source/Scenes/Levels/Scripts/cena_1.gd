extends Node

@onready var ANIMATED_LABEL = $"Player/Cabeça/Camera3D/CanvasLayer/Label"

var interagido = false

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
			if interagido:
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


func _on_telefone_interagido(_body: Variant) -> void:
	if texto:
		$Telefone.set_collision_layer_value(1, false)
		texto = !texto
		await animar_texto(frases)
		ANIMATED_LABEL.text = ""
		await get_tree().create_timer(0.4).timeout
		await animar_texto(["Analise a pasta"])
		


func _on_porta_interagido(_body: Variant) -> void:
	MudarScena.mudarCafeteria()


func _on_pasta_interagido(_body: Variant) -> void:
	interagido = true
	ANIMATED_LABEL.text = ""
	$Pasta/Pasta.hide()
	$Pasta/Pagina1.show()
	var crosshair = get_node("/root/Cena1/Player/Cabeça/Camera3D/CanvasLayer/crosshair")
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	crosshair.hide()
	$Pasta.set_collision_layer_value(1, false)

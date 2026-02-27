extends Node

@onready var ANIMATED_LABEL = $"Player/Cabeça/Camera3D/CanvasLayer/Label"

var interagido = false

var frases = 	["Alô alôoou, ...", 
				"então funcionário…", 
				"O  pessoal do departamento mandou uma mensagem",
 				"de como foi o resultado do relatorio, ...",
				"não é muito diferente do que você já tava acostumado,",
				"mas protocolo é protocolo, sabe como é né."]

var quant_vermelho

const porta = preload("res://Source/Assets/Sons/portaabrindo.ogg")


var current_text: String = ""
var texto = true

func _ready() -> void:
	
	$Porta.set_collision_layer_value(1, false)
	$Telefone.set_collision_layer_value(1, false)
	$Pasta.set_collision_layer_value(1, false)
	await get_tree().create_timer(12).timeout

	$Telefone.set_collision_layer_value(1, true)

func animar_texto(textos):
	for frase in textos:
		if interagido:
				break
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
		$Pasta.set_collision_layer_value(1, true)
		$TelefoneSom.pare()
		$Telefone.set_collision_layer_value(1, false)
		texto = !texto
		await animar_texto(frases)
		ANIMATED_LABEL.text = ""
		await get_tree().create_timer(0.4).timeout
		await animar_texto(["Abra a pasta"])

func _on_porta_interagido(_body: Variant) -> void:
	ControleSfx.toca_SFX(porta)
	MudarScena.mudarCafeteria()

func _on_pasta_interagido(_body: Variant) -> void:
	var main = get_tree().current_scene
	interagido = true
	ControleSfx.toca_Papel()
	ANIMATED_LABEL.text = ""
	$Pasta/Pasta.hide()
	if quant_vermelho.count(true) == 3:
		$Pasta/Pagina2.show()
	else:
		$Pasta/Pagina1.show()
	var crosshair = get_node("/root/Cena2/Player/Cabeça/Camera3D/CanvasLayer/crosshair")
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	crosshair.hide()
	$Pasta.set_collision_layer_value(1, false)
	await get_tree().create_timer(0.5).timeout
	$Pasta/Pagina1.connect("Porta", Callable(main, "_on_porta"))
	$Porta.set_collision_layer_value(1, true)
	

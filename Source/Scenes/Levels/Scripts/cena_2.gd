extends Node

@onready var ANIMATED_LABEL = $"Player/Cabeça/Camera3D/CanvasLayer/Label"

var interagido = false

var frases = 	["Alô alôoou, ...", 
				"então funcionário…", 
				"você deve estar se questionando o que deve fazer agora...",
 				"Siga o protocolo, esta adereçado em sua mesa",
				"Encaminharemos o resultado logo após, a máquina segue..."]
				
var frases2 = ["Era só seguir o protocolo... ",
				"Te encaminhamos uma mensagem, mas ",
				"Antes disso responda essa pergunta..."]

var quant_vermelho = [true, true, false]
var fase = true

const porta = preload("res://Source/Assets/Sons/portaabrindo.ogg")


var current_text: String = ""
var texto = true
var texto2 = true

func _ready() -> void:
	if has_node("/root/Folha"):
		var noode = get_node("/root/Folha")
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		noode.queue_free()
	
	
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
	elif texto2:
		interagido = false
		fase = false
		$Pasta.set_collision_layer_value(1, true)
		$Pasta/Folha.show()
		$TelefoneSom.pare()
		$Telefone.set_collision_layer_value(1, false)
		texto2 = !texto2
		await animar_texto(frases2)
		ANIMATED_LABEL.text = ""
		await get_tree().create_timer(0.4).timeout
		await animar_texto(["Abra a folha"])


func _on_pasta_interagido(_body: Variant) -> void:
	if fase:
		interagido = true
		ControleSfx.toca_Papel()
		ANIMATED_LABEL.text = ""
		$Pasta/Pasta.hide()
		$Pasta/Pagina1.show()
		var crosshair = get_node("/root/Cena2/Player/Cabeça/Camera3D/CanvasLayer/crosshair")
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		crosshair.hide()
		$Pasta.set_collision_layer_value(1, false)
		await get_tree().create_timer(0.5).timeout
		await $Pasta/Pagina1.visibility_changed
		if quant_vermelho.count(true) == 3:
			crosshair.show()
			await get_tree().create_timer(2).timeout
			$TelefoneSom.toca_telefone()
			$Telefone.set_collision_layer_value(1, true)
		else:
			crosshair.show()
			await get_tree().create_timer(0.6).timeout
			MudarScena.mudarFinal(1)
	else:
		interagido = true
		ControleSfx.toca_Papel()
		ANIMATED_LABEL.text = ""
		$Pasta/Folha.hide()
		$Pasta/Pagina2.show()
		var crosshair = get_node("/root/Cena2/Player/Cabeça/Camera3D/CanvasLayer/crosshair")
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		crosshair.hide()
		$Pasta.set_collision_layer_value(1, false)
		await get_tree().create_timer(0.5).timeout
		await $Pasta/Pagina2.visibility_changed
		crosshair.show()
		$Player.target_rotation = Vector2(-1.57,0)
		await get_tree().create_timer(0.6).timeout
		$Porta/portarafaelanimações/AnimationPlayer.play("Cube_001|Cube_001Action")
		await get_tree().create_timer(0.1).timeout	
		ControleSfx.toca_SFX(porta)
		await $Porta/portarafaelanimações/AnimationPlayer.animation_finished
		await get_tree().create_timer(0.2).timeout
		MudarScena.mudarFinal(3)

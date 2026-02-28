extends Control

signal Porta

@onready var fundo = $MoldeDaCartaTutorial

const PAGINA1 = preload("res://Source/Assets/Imagens/MOLDE_DA_CARTA_TUTORIAL.png")
const PAGINA2 = preload("res://Source/Assets/Imagens/mocadesaparecida.png")
const porta = preload("res://Source/Assets/Sons/portaabrindo.ogg")
var ladoFolha = false
var fim 

func _ready() -> void:
	if has_node("/root/Fim"):
		$Label.text = "Final (" + str(fim) + "/3)"
		if fim == 2:
			$MoldeDaCartaTutorial.texture = preload("res://Source/Assets/Imagens/cartadedemissaoending.png")
		elif fim == 3:
			$Label.position = Vector2(-60, 0)
			$MoldeDaCartaTutorial.hide()
			$Exit.hide()
			await get_tree().create_timer(0.75).timeout
			ControleSfx.toca_SFX(porta)
			await get_tree().create_timer(3).timeout
			MudarScena.mudarMenu()

func _on_next_page_pressed() -> void:
	ControleSfx.toca_Papel()
	fundo.texture = PAGINA2
	$PreviousPage.show()
	$Exit.show()
	$NextPage.hide()

func _on_previous_page_pressed() -> void:
	ControleSfx.toca_Papel()
	fundo.texture = PAGINA1
	$PreviousPage.hide()
	$Exit.hide()
	$NextPage.show()
		

func _on_exit_pressed() -> void:
	if has_node("/root/Fim"):
		MudarScena.mudarMenu()
	else:
		var crosshair = get_node("/root/Cena1/Player/Cabeça/Camera3D/CanvasLayer/crosshair")
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		crosshair.show()
		ControleSfx.toca_Papel()
		emit_signal("Porta")
		$".".queue_free()
	
	

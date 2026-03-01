extends Control

signal Porta

@onready var fundo = $MoldeDaCartaTutorial

const PAGINA1 = preload("res://Source/Assets/Imagens/MOLDE_DA_CARTA_TUTORIAL.png")
const PAGINA2 = preload("res://Source/Assets/Imagens/mocadesaparecida.png")
const porta = preload("res://Source/Assets/Sons/PORTATRANCADA.ogg")
var ladoFolha = false
var fim 

func _ready() -> void:
	if has_node("/root/Fim"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		$Label.text = "Final (" + str(fim) + "/3)"
		if fim == 1:
			$Label.position.x = 350
			$Label.text = $Label.text + " : Engrenagem" 
		elif fim == 2:
			$Label.position.x = 350
			$Label.text = $Label.text + " : Quebra ao protocolo"
			$MoldeDaCartaTutorial.texture = preload("res://Source/Assets/Imagens/cartadedemissaoending.png")
		elif fim == 3:
			$Label.text = $Label.text + " : Morte...?" 
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
	if has_node("/root/Cena2"):
		
		$Exit.texture_normal = preload("res://Source/Assets/Sprites/Selo confirmado verde onn.png")
		ControleSfx.toca_Carimbo1()
		await get_tree().create_timer(0.3).timeout
		$".".hide()
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		
	elif has_node("/root/Fim"):
		if fim == 1:
			Transicao.transicao()
			await Transicao.fade_acabou
			$MoldeDaCartaTutorial.hide()
			$Label.position = Vector2(-60,0)
			$Label.text ="A máquina segue"
			await get_tree().create_timer(3).timeout
		MudarScena.mudarMenu()
	else:
		var crosshair = get_node("/root/Cena1/Player/Cabeça/Camera3D/CanvasLayer/crosshair")
		Pause.doc = false
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		crosshair.show()
		ControleSfx.toca_Papel()
		emit_signal("Porta")
		$".".queue_free()
	
	

extends Control

@onready var fundo = $MoldeDaCartaTutorial

const PAGINA1 = preload("res://Source/Assets/Imagens/MOLDE_DA_CARTA_TUTORIAL.png")
const PAGINA2 = preload("res://Source/Assets/Imagens/mocadesaparecida.png")
var ladoFolha = false



func _on_next_page_pressed() -> void:
	fundo.texture = PAGINA2
	$PreviousPage.show()
	$Exit.show()
	$NextPage.hide()

func _on_previous_page_pressed() -> void:
	fundo.texture = PAGINA1
	$PreviousPage.hide()
	$Exit.hide()
	$NextPage.show()
		

func _on_exit_pressed() -> void:
	var crosshair = get_node("/root/Cena1/Player/Cabeça/Camera3D/CanvasLayer/crosshair")
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	crosshair.show()
	$".".queue_free()
	

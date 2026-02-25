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
	$".".queue_free()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

extends Node


@onready var fundo:Sprite2D = $Control/MenuPaperSemBotoesLigados


var MUSICA1 = preload("res://Source/Assets/Música/temadocari.ogg")
const TEXTURAVAZIO = preload("res://Source/Assets/Sprites/Menu_pausado1.png")
const TEXTURACONTI = preload("res://Source/Assets/Sprites/Menu_pausado4.png")
const TEXTURAOPCOE = preload("res://Source/Assets/Sprites/Menu_pausado3.png")
const TEXTURASAIR = preload("res://Source/Assets/Sprites/Menu_pausado2.png")
var menu_aberto = false

func fecha(mouse):
	
	get_tree().paused = false
	menu_aberto = false
	Input.mouse_mode = mouse
	$Control.hide()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if !has_node("/root/Main") and !$".".has_node("Options") and !get_tree().root.has_node("Folha"):
			if menu_aberto == false :
				menu_aberto = true
				Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
				$Control.show()
				get_tree().paused = true
			else:
				menu_aberto = false
				fecha(Input.MOUSE_MODE_CAPTURED)
	if event.is_action_pressed("interagir") and menu_aberto == true:
		ControleSfx.toca_Carimbo1()

func _on_botao_continuar_pressed() -> void:
	if !$".".has_node("Options"):
		fecha(Input.MOUSE_MODE_CAPTURED)
	

func _on_botao_options_pressed() -> void:
	if !$".".has_node("Options"):
		var OPCOES = preload("uid://b4afxc10lvo3d").instantiate()
		$".".add_child(OPCOES)


func _on_botao_sair_pressed() -> void:
	if !$".".has_node("Options"):
		MudarScena.mudarMenu()
		fecha(Input.MOUSE_MODE_VISIBLE)
	
func _fora() -> void:
	fundo.set_texture(TEXTURAVAZIO)
	
func _on_botao_continuar_mouse_entered() -> void:
	fundo.set_texture(TEXTURACONTI)

func _on_botao_options_mouse_entered() -> void:
	fundo.set_texture(TEXTURAOPCOE)

func _on_botao_sair_mouse_entered() -> void:
	fundo.set_texture(TEXTURASAIR)

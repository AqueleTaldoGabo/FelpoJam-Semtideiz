extends Node


@onready var fundo:Sprite2D = $Control/MenuPaperSemBotoesLigados


var mouse = Input.MOUSE_MODE_VISIBLE
var MUSICA1 = preload("res://Source/Assets/Música/temadocari.ogg")
const TEXTURAVAZIO = preload("res://Source/Assets/Sprites/Menu_pausado1.png")
const TEXTURACONTI = preload("res://Source/Assets/Sprites/Menu_pausado4.png")
const TEXTURAOPCOE = preload("res://Source/Assets/Sprites/Menu_pausado3.png")
const TEXTURASAIR = preload("res://Source/Assets/Sprites/Menu_pausado2.png")
var options_aberto = false

func fecha():
	get_tree().paused = false
	Input.mouse_mode = mouse
	if get_node("/root/Cena1/Player/Cabeça/Camera3D/CanvasLayer/Label") != null:
		get_node("/root/Cena1/Player/Cabeça/Camera3D/CanvasLayer/Label").show()
	$".".queue_free()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") and !options_aberto:
		fecha()
	else:
		options_aberto = false


func _on_botao_continuar_pressed() -> void:
	fecha()
	

func _on_botao_options_pressed() -> void:
	var OPCOES = preload("uid://b4afxc10lvo3d").instantiate()
	options_aberto = true
	get_tree().root.add_child(OPCOES)

func _on_botao_sair_pressed() -> void:
	MudarScena.mudarMenu()
	$".".queue_free()
	
func _fora() -> void:
	fundo.set_texture(TEXTURAVAZIO)
	
func _on_botao_continuar_mouse_entered() -> void:
	fundo.set_texture(TEXTURACONTI)

func _on_botao_options_mouse_entered() -> void:
	fundo.set_texture(TEXTURAOPCOE)

func _on_botao_sair_mouse_entered() -> void:
	fundo.set_texture(TEXTURASAIR)

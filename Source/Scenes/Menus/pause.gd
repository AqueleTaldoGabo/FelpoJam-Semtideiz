extends Node

@onready var fundo:Sprite2D = $Control/MenuPaperSemBotoesLigados

var mouse = Input.MOUSE_MODE_VISIBLE
var OPCOES = preload("uid://b4afxc10lvo3d").instantiate()
var MUSICA1 = preload("res://Source/Música/temadocari.ogg")
const TEXTURAVAZIO = preload("res://Source/Assets/Sprites/Menu_pausado1.png")
const TEXTURACONTI = preload("res://Source/Assets/Sprites/Menu_pausado4.png")
const TEXTURAOPCOE = preload("res://Source/Assets/Sprites/Menu_pausado3.png")
const TEXTURASAIR = preload("res://Source/Assets/Sprites/Menu_pausado2.png")

func fecha():
	get_tree().paused = false
	Input.mouse_mode = mouse
	get_tree().root.remove_child($".")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		fecha()

func _on_botao_continuar_pressed() -> void:
	fecha()
	

func _on_botao_options_pressed() -> void:
	get_tree().root.add_child(OPCOES)

func _on_botao_sair_pressed() -> void:
	Transicao.transicao()
	ControleMusica.fade_out()
	await Transicao.fade_acabou
	ControleMusica.trocar_musica(MUSICA1)
	get_tree().change_scene_to_file("res://Source/Scenes/Levels/Menu.tscn")
	get_tree().paused = false
	get_tree().root.remove_child($".")
	
func _fora() -> void:
	fundo.set_texture(TEXTURAVAZIO)
	
func _on_botao_continuar_mouse_entered() -> void:
	fundo.set_texture(TEXTURACONTI)

func _on_botao_options_mouse_entered() -> void:
	fundo.set_texture(TEXTURAOPCOE)

func _on_botao_sair_mouse_entered() -> void:
	fundo.set_texture(TEXTURASAIR)

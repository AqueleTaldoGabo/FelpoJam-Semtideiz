extends VBoxContainer

@onready var fundo:Sprite2D = $".."
var CENA_1 = preload("uid://mq5h3p2in5jw").instantiate()
var OPCOES = preload("uid://b4afxc10lvo3d").instantiate()
const TEXTURAJOGAR = preload("res://Source/Assets/Sprites/Menu_paper_jogar_ligados.png")
const TEXTURACONFI = preload("res://Source/Assets/Sprites/Menu_paper_opcoes_ligado.png")
const TEXTURASAIR  = preload("res://Source/Assets/Sprites/Menu_paper_sair_ligado.png")
const TEXTURAVAZIO = preload("res://Source/Assets/Sprites/Menu_paper_sem_botoes_ligados.png")
var MUSICA2 = preload("res://Source/Música/menucarimbador.ogg")

func _on_botao_start_pressed() -> void:
	var cur_scene = get_tree().get_current_scene()
	Transicao.transicao()
	ControleMusica.fade_out()
	await Transicao.fade_acabou
	ControleMusica.trocar_musica(MUSICA2)
	get_tree().root.add_child(CENA_1)
	get_tree().root.remove_child(cur_scene)
	

func _on_botao_options_pressed() -> void:
	var cur_scene = get_tree().get_current_scene()
	get_tree().root.add_child(OPCOES)

func _on_botao_sair_pressed() -> void:
	get_tree().quit()

func _on_botao_start_mouse_entered() -> void:
	fundo.set_texture(TEXTURAJOGAR)

func _on_botao_options_mouse_entered() -> void:
	fundo.set_texture(TEXTURACONFI)

func _on_botao_sair_mouse_entered() -> void:
	fundo.set_texture(TEXTURASAIR)

func _fora() -> void:
	fundo.set_texture(TEXTURAVAZIO)

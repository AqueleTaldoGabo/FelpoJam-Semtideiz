extends VBoxContainer

@onready var fundo:Sprite2D = $".."

var OPCOES = preload("uid://b4afxc10lvo3d").instantiate()
const TEXTURAJOGAR = preload("res://Source/Assets/Sprites/Menu_paper_jogar_ligados.png")
const TEXTURACONFI = preload("res://Source/Assets/Sprites/Menu_paper_opcoes_ligado.png")
const TEXTURASAIR  = preload("res://Source/Assets/Sprites/Menu_paper_sair_ligado.png")
const TEXTURAVAZIO = preload("res://Source/Assets/Sprites/Menu_paper_sem_botoes_ligados.png")
const MUSICA2 = preload("res://Source/Música/menucarimbador.ogg")

func _on_botao_start_pressed() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	Transicao.transicao()
	ControleMusica.fade_out()
	await Transicao.fade_acabou
	ControleMusica.trocar_musica(MUSICA2)
	get_tree().change_scene_to_file("res://Source/Scenes/Levels/Cena1.tscn")
	
func _on_botao_options_pressed() -> void:
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

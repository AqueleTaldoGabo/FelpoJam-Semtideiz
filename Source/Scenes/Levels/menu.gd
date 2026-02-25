extends VBoxContainer

@onready var fundo:Sprite2D = $".."


const TEXTURAJOGAR = preload("res://Source/Assets/Sprites/Menu_paper_jogar_ligados.png")
const TEXTURACONFI = preload("res://Source/Assets/Sprites/Menu_paper_opcoes_ligado.png")
const TEXTURASAIR  = preload("res://Source/Assets/Sprites/Menu_paper_sair_ligado.png")
const TEXTURAVAZIO = preload("res://Source/Assets/Sprites/Menu_paper_sem_botoes_ligados.png")


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interagir"):
		ControleSfx.toca_Carimbo1()

func _on_botao_start_pressed() -> void:
	MudarScena.mudarCena1()

func _on_botao_options_pressed() -> void:
	var OPCOES = preload("uid://b4afxc10lvo3d").instantiate()
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

extends Node

@onready var fundo:Sprite2D = $Control/MenuOpcoes
const SAIR = preload("res://Source/Assets/Sprites/Menu_Opcoes_sair_ligado.png")
const NORMAL = preload("res://Source/Assets/Sprites/Menu_Opcoes.png")

func _on_button_pressed() -> void:
	get_tree().root.remove_child($".")
	
func _on_button_mouse_entered() -> void:
	fundo.set_texture(SAIR)

func _on_button_mouse_exited() -> void:
	fundo.set_texture(NORMAL)

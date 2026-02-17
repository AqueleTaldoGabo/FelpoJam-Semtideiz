extends Button

@onready var fundo:Sprite2D = $".."
const SAIR = preload("res://Source/Assets/Sprites/Menu_Opcoes_sair_ligado.png")
const NORMAL = preload("res://Source/Assets/Sprites/Menu_Opcoes.png")

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Source/main.tscn")
	
func _on_mouse_entered() -> void:
	fundo.set_texture(SAIR)

func _on_mouse_exited() -> void:
	fundo.set_texture(NORMAL)

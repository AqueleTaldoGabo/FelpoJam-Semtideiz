extends Node

@onready var fundo:Sprite2D = $Control/MenuOpcoes
@onready var mouse = Input.MOUSE_MODE_VISIBLE
const SAIR = preload("res://Source/Assets/Sprites/Menu_Opcoes_sair_ligado.png")
const NORMAL = preload("res://Source/Assets/Sprites/Menu_Opcoes.png")

func _ready() -> void:
	$Control/MenuOpcoes/Vol_Principal.value = AudioServer.get_bus_volume_linear(AudioServer.get_bus_index("Master"))
	$Control/MenuOpcoes/Vol_Musica.value = AudioServer.get_bus_volume_linear(AudioServer.get_bus_index("Musica"))
	$Control/MenuOpcoes/Vol_SFX.value = AudioServer.get_bus_volume_linear(AudioServer.get_bus_index("SFX"))

func _on_button_pressed() -> void:
	get_tree().root.remove_child($".")
	Input.mouse_mode = mouse
	
func _on_button_mouse_entered() -> void:
	fundo.set_texture(SAIR)
	

func _on_button_mouse_exited() -> void:
	fundo.set_texture(NORMAL)


func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))


func _on_vol_musica_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Musica"), linear_to_db(value))


func _on_vol_sfx_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(value))

extends Node

@onready var fundo:Sprite2D = $Control/MenuOpcoes

const SAIR = preload("res://Source/Assets/Sprites/Menu_Opcoes_sair_ligado.png")
const NORMAL = preload("res://Source/Assets/Sprites/Menu_Opcoes.png")

func fecha():
	$".".queue_free()
	

func _ready() -> void:
	$Control/MenuOpcoes/Vol_Principal.value = AudioServer.get_bus_volume_linear(AudioServer.get_bus_index("Master"))
	$Control/MenuOpcoes/Vol_Musica.value = AudioServer.get_bus_volume_linear(AudioServer.get_bus_index("Musica"))
	$Control/MenuOpcoes/Vol_SFX.value = AudioServer.get_bus_volume_linear(AudioServer.get_bus_index("SFX"))

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		fecha()

func _on_button_pressed() -> void:
	fecha()

func _on_button_mouse_entered() -> void:
	fundo.set_texture(SAIR)
	

func _on_button_mouse_exited() -> void:
	fundo.set_texture(NORMAL)


func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))


func _on_vol_musica_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Musica"), linear_to_db(value))


func _on_vol_sfx_value_changed(value: float) -> void:
	ControleSfx.toca_Carimbo1()
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(value))

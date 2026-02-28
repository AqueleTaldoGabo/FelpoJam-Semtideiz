extends VBoxContainer

@onready var fundo:Sprite2D = $".."


const TEXTURAJOGAR = preload("res://Source/Assets/Sprites/(Jogar) Menu Principal final.png")
const TEXTURACONFI = preload("res://Source/Assets/Sprites/(Opções) Menu Principal final.png")
const TEXTURACREDITO = preload("res://Source/Assets/Sprites/(Creditos) Menu Principal final.png")
const TEXTURASAIR  = preload("res://Source/Assets/Sprites/(Sair) Menu Principal final.png")
const TEXTURAVAZIO = preload("res://Source/Assets/Sprites/Menu Principal final.png")


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


func _on_botao_creditos_pressed() -> void:
	MudarScena.mudarCredito()


func _on_botao_creditos_mouse_entered() -> void:
	fundo.set_texture(TEXTURACREDITO)
	

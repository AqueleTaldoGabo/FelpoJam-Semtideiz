extends AudioStreamPlayer

const telefone  = preload("res://Source/Assets/Sons/telefonetocando.ogg")
const telefone2 = preload("res://Source/Assets/Sons/pegouotelefone.ogg")

func _ready() -> void:
	await get_tree().create_timer(12).timeout
	$".".stream = telefone
	$".".play()
	
func pare():
	$".".stream = telefone2
	$".".play()

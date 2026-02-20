extends interagivel

var OPCOES = preload("uid://b4afxc10lvo3d").instantiate()

func _on_interagido(body: Variant) -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	OPCOES.mouse = Input.MOUSE_MODE_CAPTURED
	get_tree().root.add_child(OPCOES)
	

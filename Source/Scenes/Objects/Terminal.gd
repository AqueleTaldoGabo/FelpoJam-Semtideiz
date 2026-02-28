extends interagivel

const pc = preload("res://Source/Assets/Sons/BOTAOAPERTAVEL.ogg")
var interagindo = false

func _on_interagido(_body: Variant) -> void:
	if interagindo == false:
		$Control.show()
		interagindo = true
		ControleSfx.toca_SFX(pc)
		var crosshair = get_node("/root/" + get_tree().current_scene.name + "/Player/Cabeça/Camera3D/CanvasLayer/crosshair")
		crosshair.hide()
		
	
func _input(event: InputEvent) -> void:
	if event is not InputEventMouse:
		$Control.hide()
		interagindo = false
		var crosshair = get_node("/root/" + get_tree().current_scene.name + "/Player/Cabeça/Camera3D/CanvasLayer/crosshair")
		crosshair.show()

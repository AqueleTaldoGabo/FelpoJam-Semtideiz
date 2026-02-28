extends interagivel

var folha = false
var interagindo = false

func _on_interagido(_body: Variant) -> void:
	if interagindo == false:
		$Control.show()
		interagindo = true
		ControleSfx.toca_Papel()
		var crosshair = get_node("/root/" + get_tree().current_scene.name + "/Player/Cabeça/Camera3D/CanvasLayer/crosshair")
		crosshair.hide()
		
	
func _input(event: InputEvent) -> void:
	if event is not InputEventMouse:
		$Control.hide()
		if has_node("./Control2"):
			$Control2.hide()
		interagindo = false
		var crosshair = get_node("/root/" + get_tree().current_scene.name + "/Player/Cabeça/Camera3D/CanvasLayer/crosshair")
		crosshair.show()
	if interagindo:
		if event.is_action_pressed("interagir"):
			ControleSfx.toca_Papel()
			if folha == false:	
				if has_node("./Control2"):
					$Control2.show()
				$Control.hide()
				folha = true
			else:
				if has_node("./Control2"):
					$Control2.hide()
				$Control.show()
				folha = false
			

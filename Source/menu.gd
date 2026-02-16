extends VBoxContainer

const CENA_1 = preload("uid://mq5h3p2in5jw")

func _on_botao_start_pressed() -> void:
	get_tree().change_scene_to_packed(CENA_1)	

func _on_botao_sair_pressed() -> void:
	get_tree().quit()

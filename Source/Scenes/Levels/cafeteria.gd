extends Node


func _on_mudar_algo(valor):
	if valor == 20:
		$Vinyl.hide()
	else:
		$Vinyl.show()

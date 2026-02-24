extends interagivel

@onready var Luz = $portaMALCONOVA2/SpotLight3D


func _on_olhado(bolean: Variant) -> void:
	if !bolean and Luz.light_energy > 2.7:
		$AnimationPlayer.play_backwards()
	elif bolean and Luz.light_energy == 0:
		$AnimationPlayer.play("Luz")

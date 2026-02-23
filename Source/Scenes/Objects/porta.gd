extends interagivel

@onready var Luz = $portaMALCONOVA2/SpotLight3D


func _process(delta: float) -> void:
	if !sendo_olhado and Luz.light_energy > 2.7:
		$AnimationPlayer.play_backwards()
	elif sendo_olhado and Luz.light_energy == 0:
		$AnimationPlayer.play("Luz")

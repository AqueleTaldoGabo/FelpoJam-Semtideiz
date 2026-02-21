extends interagivel

signal MudarCenar

@onready var Luz = $portaMALCONOVA2/SpotLight3D
var MUSICA1 = preload("res://Source/Música/temadocari.ogg")

func _on_interagido(body: Variant) -> void:
	Transicao.transicao()
	ControleMusica.fade_out()
	await Transicao.fade_acabou
	ControleMusica.trocar_musica(MUSICA1)
	MudarCenar.emit()
	
func _process(delta: float) -> void:
	if !sendo_olhado and Luz.light_energy > 2.7:
		$AnimationPlayer.play_backwards()
	elif sendo_olhado and Luz.light_energy == 0:
		$AnimationPlayer.play("Luz")

extends CanvasLayer

signal fade_acabou

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer

func _ready() -> void:
	color_rect.visible = false
	animation_player.animation_finished.connect(_terminou_animacao)
	
func _terminou_animacao(anim_nome):
	if anim_nome == "fadein":
		fade_acabou.emit()
		animation_player.play("fadeout")
	else:
		color_rect.visible = false

func transicao():
	color_rect.visible = true
	animation_player.play("fadein")

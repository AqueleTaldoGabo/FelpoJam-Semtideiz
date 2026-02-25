extends Node

@onready var tocador = $"."

const carimbo1 = preload("res://Source/Assets/Sons/carimbomoderno2.ogg")

func toca_SFX(audio : AudioStream):
	tocador.stream = audio
	tocador.play()

func toca_Carimbo1():
	toca_SFX(carimbo1)

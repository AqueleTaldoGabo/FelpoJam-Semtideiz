extends Node

@onready var tocador = $"."

const carimbos = [preload("res://Source/Assets/Sons/carimbomoderno1.ogg"), 
				  preload("res://Source/Assets/Sons/carimbomoderno2.ogg")]

func toca_SFX(audio : AudioStream):
	tocador.stream = audio
	tocador.play()

func toca_Carimbo1():
	toca_SFX(carimbos[randi_range(0,1)])

extends Node

@onready var tocador = $"."

const carimbos = [preload("res://Source/Assets/Sons/carimbomoderno1.ogg"), 
				  preload("res://Source/Assets/Sons/carimbomoderno2.ogg")]
				
const folhas = [preload("res://Source/Assets/Sons/pegandopapel1.ogg"),
				preload("res://Source/Assets/Sons/pegandopapel2.ogg"),
				preload("res://Source/Assets/Sons/pegandopapel3.ogg"),
				preload("res://Source/Assets/Sons/pegandopapel4.ogg")]

const botao = preload("res://Source/Assets/Sons/BOTAOAPERTAVEL.ogg")

func toca_SFX(audio : AudioStream):
	tocador.stream = audio
	tocador.play()

func toca_Carimbo1():
	toca_SFX(carimbos[randi_range(0,1)])

func toca_Papel():
	toca_SFX(folhas[randi_range(0,3)])
	
func toca_Botao():
	toca_SFX(botao)
	

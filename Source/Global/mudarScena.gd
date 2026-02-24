extends Node

const MUSICA1 = preload("res://Source/Assets/Música/temadocari.ogg")
const MUSICA2 = preload("res://Source/Assets/Música/menucarimbador.ogg")
@onready var Cafeteria = preload("res://Source/Scenes/Levels/Cafeteria.tscn")
@onready var Cena1 = preload("res://Source/Scenes/Levels/Cena1.tscn")
@onready var Menu = preload("res://Source/Scenes/Levels/Menu.tscn")

func mudarCafeteria():
	Transicao.transicao()
	ControleMusica.fade_out()
	await Transicao.fade_acabou
	get_tree().change_scene_to_packed(Cafeteria)
	ControleMusica.trocar_musica(MUSICA1)

func mudarCena1():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	Transicao.transicao()
	ControleMusica.fade_out()
	await Transicao.fade_acabou
	ControleMusica.trocar_musica(MUSICA2)
	get_tree().change_scene_to_packed(Cena1)

func mudarMenu():
	Transicao.transicao()
	ControleMusica.fade_out()
	await Transicao.fade_acabou
	ControleMusica.trocar_musica(MUSICA1)
	get_tree().change_scene_to_packed(Menu)
	get_tree().paused = false
	

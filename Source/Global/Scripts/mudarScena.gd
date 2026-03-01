extends Node

class_name ControleScena

const MUSICA1 = preload("res://Source/Assets/Música/menucarimbooficial.ogg")
const MUSICA2 = preload("res://Source/Assets/Música/musicaquarto.ogg")
const musicaCredito = preload("res://Source/Assets/Música/endingcarimbo2.ogg")
@onready var Cafeteria = preload("res://Source/Scenes/Levels/Cenas/Cafeteria.tscn")
@onready var Cena1 = preload("res://Source/Scenes/Levels/Cenas/Cena1.tscn")
@onready var Menu = preload("res://Source/Scenes/Levels/Cenas/Menu.tscn")
@onready var Cena2 = preload("res://Source/Scenes/Levels/Cenas/Cena2.tscn")
@onready var Credito = preload("res://Source/Scenes/Levels/Cenas/Creditos.tscn")
@onready var Final = preload("res://Source/Scenes/Levels/Cenas/Fim.tscn")

func mudarCafeteria():
	Transicao.transicao()
	ControleMusica.fade_out()
	await Transicao.fade_acabou
	get_tree().change_scene_to_packed(Cafeteria)

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
	
func mudarMenu2():
	Transicao2.transicao()
	ControleMusica.fade_out()
	await Transicao2.fade_acabou
	ControleMusica.trocar_musica(MUSICA1)
	get_tree().change_scene_to_packed(Menu)
	get_tree().paused = false
	
func mudarCredito():
	Transicao.transicao()
	ControleMusica.fade_out()
	await Transicao.fade_acabou
	ControleMusica.trocar_musica(musicaCredito)
	get_tree().change_scene_to_packed(Credito)
	
func mudarFim(quant_ver):
	Transicao.transicao()
	ControleMusica.fade_out()
	await Transicao.fade_acabou
	ControleMusica.stop()
	var Cen2 = Cena2.instantiate()
	Cen2.quant_vermelho = quant_ver
	get_tree().current_scene.queue_free()
	get_tree().root.add_child(Cen2)
	get_tree().current_scene = Cen2

func mudarFinal(fim):
	Transicao.transicao()
	ControleMusica.fade_out()
	await Transicao.fade_acabou
	var Finalizacao = Final.instantiate()
	var tela = Finalizacao.get_node("Pagina1")
	tela.fim = fim
	get_tree().current_scene.queue_free()
	get_tree().root.add_child(Finalizacao)
	get_tree().current_scene = Finalizacao

extends CharacterBody3D

@export var velocidade = 5
@export var sensibilidade_mouse = 0.0013
@export var se_move = true
@export var size_raio = -5
@export var folha = false
@onready var target_rotation = Vector2(1.57,0) 
var menu_aberto = false
var folha_aberta = false
var ease_curve: float = 0.1

@onready var PAUSE = preload("uid://bxum0b78ybr3a").instantiate()
@onready var PAGINA = preload("uid://c1laawrklqnhp").instantiate()

var velocidade_objeto = Vector3.ZERO

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		target_rotation -= event.relative * sensibilidade_mouse
		target_rotation.y = clampf(target_rotation.y, PI/-2, PI/2)
	if event.is_action_pressed("ui_cancel"):
		if menu_aberto == false and folha_aberta == false:
			menu_aberto = true
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			PAUSE.mouse = Input.MOUSE_MODE_CAPTURED
			get_tree().root.add_child(PAUSE)
			get_tree().paused = true
		else:
			folha_aberta = false


	if event.is_action_pressed("abrir_pagina") and folha:
		folha_aberta = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		get_tree().root.add_child(PAGINA)
		var main = get_tree().current_scene
		PAGINA.connect("mudar_algo", Callable(main, "_on_mudar_algo"))


func _process(delta: float) -> void:
	menu_aberto = false

		
func _physics_process(delta: float) -> void:
	
	rotation.y = lerp_angle(rotation.y, target_rotation.x, ease(delta, ease_curve))
	$"Cabeça/Camera3D".rotation.x = lerp_angle($"Cabeça/Camera3D".rotation.x, target_rotation.y, ease(delta, ease_curve))
	
	
	var input = Input.get_vector("anda_esquerda", "anda_direita", "anda_frente", "anda_tras")
	var direcao = transform.basis * Vector3(input.x, 0, input.y)
	
	if direcao != Vector3.ZERO:
		direcao = direcao.normalized()
	if se_move:
		velocidade_objeto.x = direcao.x * velocidade
		velocidade_objeto.z = direcao.z * velocidade
	else:
		velocidade_objeto.x = 0
		velocidade_objeto.y = 0
	velocity = velocidade_objeto 
	move_and_slide()

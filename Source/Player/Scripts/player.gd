extends CharacterBody3D

@export var velocidade = 2.5
@export var sensibilidade_mouse = 0.0013
@export var se_move = true
@export var size_raio = -5
@export var folha = false
@export var corA: Vector4 = Vector4(0.2, 0.1, 0.0, 1.0)
@export var corB: Vector4 = Vector4(0.5, 0.5, 0.1, 1.0)
@export var lockado = false
@onready var target_rotation = Vector2(1.57,0) 
@onready var camera = $"Cabeça/Camera3D"
@onready var shader = $"Cabeça/Camera3D/PosProcessamento"
@onready var materialshader = shader.get_active_material(0)

var folhas = 2
var menu_aberto = false
var ease_curve: float = 0.1
var velocidade_objeto = Vector3.ZERO
var _adjacency_matrix_player 
var vermelho = false
var segredo = false
var primeira_vez = true

func _ready() -> void:
	materialshader.set_shader_parameter("cor_a", corA)
	materialshader.set_shader_parameter("cor_b", corB)
	

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		target_rotation -= event.relative * sensibilidade_mouse
		target_rotation.y = clampf(target_rotation.y, PI/-2, PI/2)

	if event.is_action_pressed("abrir_pagina") and folha and !get_tree().root.has_node("Folha") and !lockado:
		var main = get_tree().current_scene
		var PAGINA = preload("uid://c1laawrklqnhp").instantiate()
		
		if primeira_vez:
			PAGINA.primeira_vez = true
			primeira_vez = false
		
		if vermelho:
			PAGINA.vermelho = true
		if segredo:
			PAGINA.secredo = true
		$"Cabeça/Camera3D/CanvasLayer/Label".text = ""
		PAGINA.folha = folhas
		if _adjacency_matrix_player != null:
			PAGINA._adjacency_matrix = _adjacency_matrix_player
		PAGINA.mudarPag()
		$"Cabeça/Camera3D/CanvasLayer/crosshair".hide()
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		PAGINA.connect("mudar_algo", Callable(main, "_on_mudar_algo"))
		ControleSfx.toca_Papel()
		get_tree().root.add_child(PAGINA)
		
	
func _process(delta: float) -> void:
	var easeusado = ease(delta, ease_curve)
	rotation.y = lerp_angle(rotation.y, target_rotation.x, easeusado)
	camera.rotation.x = lerp_angle(camera.rotation.x, target_rotation.y, easeusado)
		
func _physics_process(_delta: float) -> void:
	var input = Input.get_vector("anda_esquerda", "anda_direita", "anda_frente", "anda_tras")
	var direcao = transform.basis * Vector3(input.x, 0, input.y)
	if direcao != Vector3.ZERO:
		direcao = direcao.normalized()
		if !$Passo.playing:
			$Passo.play()
		
	if se_move:
		velocidade_objeto.x = direcao.x * velocidade
		velocidade_objeto.z = direcao.z * velocidade
	else:
		velocidade_objeto.x = 0
		velocidade_objeto.y = 0
		
	if $Passo.get_playback_position() > 0.55:
			$Passo.stop()
	velocity = velocidade_objeto 
	move_and_slide()
	
	

extends CharacterBody3D

@export var velocidade = 5
@export var sensibilidade_mouse = 0.002

var velocidade_objeto = Vector3.ZERO

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * sensibilidade_mouse)
		$Camera3D.rotate_x(-event.relative.y * sensibilidade_mouse)
		$Camera3D.rotation.x = clampf($Camera3D.rotation.x, -deg_to_rad(70), deg_to_rad(70))

func _physics_process(delta: float) -> void:
	var input = Input.get_vector("anda_esquerda", "anda_direita", "anda_frente", "anda_tras")
	var direcao = transform.basis * Vector3(input.x, 0, input.y)
	
	if direcao != Vector3.ZERO:
		direcao = direcao.normalized()
		
	velocidade_objeto.x = direcao.x * velocidade
	velocidade_objeto.z = direcao.z * velocidade
	velocity = velocidade_objeto 
	move_and_slide()

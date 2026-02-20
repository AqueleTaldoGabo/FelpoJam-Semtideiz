extends CollisionObject3D

class_name interagivel

signal interagido(body)
var sendo_olhado = false

func foiinteragido(body):
	interagido.emit(body)

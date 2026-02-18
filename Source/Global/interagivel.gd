extends CollisionObject3D

class_name interagivel

signal interagido(body)

func foiinteragido(body):
	interagido.emit(body)

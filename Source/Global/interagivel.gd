extends CollisionObject3D

class_name interagivel

signal interagido(body)
signal olhado(bolean)

func foiolhado(bolean):
	olhado.emit(bolean)

func foiinteragido(body):
	interagido.emit(body)

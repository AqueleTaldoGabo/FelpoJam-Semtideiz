extends MultiMeshInstance3D

var vetores = [Vector3(-1.575, 1.06, -4.043), Vector3(-1.575, 1.06, -5.899), Vector3(-0.713, 1.06, -4.043), Vector3(-0.713, 1.06, -5.899), 
				Vector3(-1.575, 1.06, -1.400), Vector3(-1.575, 1.06, -3.263), Vector3(-0.713, 1.06, -1.400), Vector3(-0.713, 1.06, -3.263),
				Vector3(-7.834, 1.06, 4.987), Vector3(-9.667, 1.06, 4.987), Vector3(-7.834, 1.06, 4.088), Vector3(-9.667, 1.06, 4.088),
				Vector3(-4.893, 1.06, 4.987), Vector3(-6.755, 1.06, 4.987), Vector3(-4.893, 1.06, 4.088), Vector3(-6.755, 1.06, 4.088),
				Vector3(-7.834, 1.06, 2.31), Vector3(-9.667, 1.06, 2.31), Vector3(-7.834, 1.06, 1.499), Vector3(-9.667, 1.06, 1.499),
				Vector3(-4.893, 1.06, 2.31), Vector3(-6.755, 1.06, 2.31), Vector3(-4.893, 1.06, 1.499), Vector3(-6.755, 1.06, 1.499)]
var lado = true
var rotacionador = -180
var rotacionado2 = 0
var direita = Vector3(24, 25, 4)

func _ready() -> void:
	for i in 24:
		var deixa_horizontal
		if i > 7:
			rotacionador = -90
			rotacionado2 = 90
			direita = Vector3(4, 25, 24)
		if lado:
			deixa_horizontal = Basis(Vector3.UP, deg_to_rad(rotacionador))
			lado = false
		else:
			deixa_horizontal = Basis(Vector3.UP, deg_to_rad(rotacionado2))
			lado = true
		
		var final = deixa_horizontal
		final = final.scaled(direita)

		multimesh.set_instance_transform(i, Transform3D(final, vetores[i]))

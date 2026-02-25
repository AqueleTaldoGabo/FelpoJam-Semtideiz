extends MultiMeshInstance3D

var vetores = [Vector3(-11.587, 0.6, 5.687), Vector3(-11.946, 0.6, 3.783), Vector3(-12.823, 0.6, 2.093),
				Vector3(-14.142, 0.6, 0.834), Vector3(-16.594, 0.6, 0.109)]

func _ready() -> void:
	for i in range(5):
		var angulo_de_cada = deg_to_rad(i * 20)
		var deixa_vertical = Basis(Vector3.RIGHT, deg_to_rad(-90))
		var rotacao = Basis(Vector3.UP, angulo_de_cada + 3.4)
		var final = rotacao * deixa_vertical
		final = final.scaled(Vector3(23, 25, 23))
		
		multimesh.set_instance_transform(i, Transform3D(final, vetores[i]))

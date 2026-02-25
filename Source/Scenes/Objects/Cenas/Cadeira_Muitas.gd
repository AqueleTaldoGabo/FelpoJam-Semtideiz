extends MultiMeshInstance3D

var vetores = [Vector3(-11.687, 0.114, 5.577), Vector3(-12.086, 0.114, 3.703), Vector3(-12.977, 0.114, 2.083),
				Vector3(-14.287, 0.114, 0.904), Vector3(-16.728, 0.114, 0.199)]

func _ready() -> void:
	for i in range(5):
		var angulo_de_cada = deg_to_rad(i * 20)
		var deixa_vertical = Basis(Vector3.RIGHT, deg_to_rad(-90))
		var rotacao = Basis(Vector3.UP, angulo_de_cada + 3.4)
		var final = rotacao * deixa_vertical
		final = final.scaled(Vector3(23, 2.6, 23))
		
		multimesh.set_instance_transform(i, Transform3D(final, vetores[i]))

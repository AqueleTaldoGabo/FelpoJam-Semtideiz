extends MultiMeshInstance3D

var vetores = [Vector3(-11.687, 2, 5.577), Vector3(-12.086, 2, 3.703), Vector3(-12.977, 2, 2.083),
				Vector3(-14.287, 2, 0.904), Vector3(-16.728, 2, 0.199)]

func _ready() -> void:
	for i in range(5):
		multimesh.set_instance_transform(i, Transform3D(Basis(), vetores[i]))

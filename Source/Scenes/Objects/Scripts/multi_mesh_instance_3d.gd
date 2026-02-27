extends MultiMeshInstance3D

var vetores = [Vector3(-16.252, 1.06, -5.569), Vector3(-17.962, 1.06, -5.494), Vector3(-18.831, 1.06, -5.553), 
				Vector3(-20.513, 1.06, -5.494)]
var lado = true


func _ready() -> void:
	for i in 4:
		var deixa_horizontal
		if lado == true:
			deixa_horizontal = Basis(Vector3.UP, deg_to_rad(-90))
			lado = false
		else :
			deixa_horizontal = Basis(Vector3.UP, deg_to_rad(90))
			lado = true
		var final = deixa_horizontal
		final = final.scaled(Vector3(4, 25, 24))

		multimesh.set_instance_transform(i, Transform3D(final, vetores[i]))

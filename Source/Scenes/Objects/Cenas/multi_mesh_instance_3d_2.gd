extends MultiMeshInstance3D

var vetores = [Vector3(-1.997, 0.022, 9.874), Vector3(-5.933, 0.022, 9.874), Vector3(-10.007, 0.022, 9.874)]
var lado = true


func _ready() -> void:
	var deixa_vertical = Basis(Vector3.RIGHT, deg_to_rad(-90))
	for i in 3:
		
		var final = deixa_vertical
		final = final.scaled(Vector3(22, 22, 22))
		multimesh.set_instance_transform(i, Transform3D(final, vetores[i]))

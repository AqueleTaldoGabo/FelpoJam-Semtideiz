extends MultiMeshInstance3D

var vetores = [Vector3(-0.437, 0.063, 9.939), Vector3(-3.464, 0.063, 9.939), Vector3(-4.417, 0.063, 9.939),
				Vector3(-7.444, 0.063, 9.939), Vector3(-8.415, 0.063, 9.939), Vector3(-11.452, 0.063, 9.939)]
var lado = true

func _ready() -> void:
	var deixa_vertical = Basis(Vector3.RIGHT, deg_to_rad(-90))
	for i in range(6):
		
		var deixa_horizontal
		if lado:
			deixa_horizontal = Basis(Vector3.UP, deg_to_rad(-180))
			lado = false
		else:
			deixa_horizontal = Basis(Vector3.UP, deg_to_rad(0))
			lado = true
		
		var final = deixa_horizontal * deixa_vertical
		final = final.scaled(Vector3(23, 25, 30))
		
		multimesh.set_instance_transform(i, Transform3D(final, vetores[i]))

extends MultiMeshInstance3D

var vetores = [Vector3(-1.154, 0.022, -4.982), Vector3(-1.154, 0.022, -2.346), Vector3(-8.749, 0.022, 4.559), 
				Vector3(-5.837, 0.022, 4.559), Vector3(-8.751, 0.022, 1.969), Vector3(-5.819, 0.022, 2.001)]
var lado = true


func _ready() -> void:
	var deixa_vertical = Basis(Vector3.RIGHT, deg_to_rad(-90))
	for i in 6:
		var deixa_horizontal
		deixa_horizontal = Basis(Vector3.UP, deg_to_rad(-90))
		if i > 1:
			deixa_horizontal = Basis(Vector3.UP, deg_to_rad(0))
		
		var final = deixa_horizontal*deixa_vertical
		final = final.scaled(Vector3(18, 19, 18))
		print(i)
		multimesh.set_instance_transform(i, Transform3D(final, vetores[i]))

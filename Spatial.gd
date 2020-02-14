extends Area



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Spatial_body_entered(body):
	if "KnaboDu" in body.name:
		queue_free()
	pass # Replace with function body.

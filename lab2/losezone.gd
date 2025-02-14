extends Area2D

@export var score = 0

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

# Connects code to scorezone.gd
signal score_reset

# Resets score to zero upon loss
func _on_area_entered(area):
	if area.has_method("spawn"):
		area.spawn()
	emit_signal("score_reset")
	#score = 0
	#get_parent().get_node("Label").text = str(score)

extends Area2D

@export var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$losezone.connect("score_reset", Callable(self, "_on_score_reset"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_entered(area):
	score += 1
	update_score_display()

func _on_score_reset():
	score = 0
	update_score_display()

func update_score_display():
	$Label.text = str(score)

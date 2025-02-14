extends Area2D

@export var score = 0

func _ready():
	$losezone.connect("score_reset", Callable(self, "_on_score_reset"))

func _process(delta):
	pass

# Increments score when ball hits ceiling
func _on_area_entered(area):
	score += 1
	update_score_display()

# Resets score when ball hits floor
func _on_score_reset():
	score = 0
	update_score_display()

# Ensures that score value and label text match
func update_score_display():
	$Label.text = str(score)

extends Area2D

@export var velocity : Vector2
@export var blue_speed : float = 0.05 

var current_color : Color = Color(1, 1, 1)  # Starts out white
@onready var color_rect : ColorRect = $ColorRect 

func _ready():
	spawn()

func _process(delta: float) -> void:
	position += velocity   # Move the ball
# Bounce off left and right walls
	if position.x <= 0 or position.x >= get_viewport_rect().size.x:
		velocity.x = -velocity.x
# Bounce off ceiling
	if position.y <= 0:
		velocity.y = -velocity.y
# Respawn after loss
	if position.y >= get_viewport_rect().size.y:
		spawn()
# Progressively change color of ball to blue / hex #0000ff
	current_color = current_color.lerp(Color.BLUE, blue_speed * delta)
	color_rect.color = current_color

func _on_area_entered(area):
	if area.is_in_group("paddle"):
		velocity.y = -velocity.y  # Reverse vertical direction
		velocity.x += randf_range(-1, 1)  # Add slight horizontal variation
	else:
		velocity = -velocity  # For wall collisions

func spawn():
	position = get_viewport_rect().size/2
	velocity = Vector2(randf_range(-5,5), randf_range(-5,5))
	current_color = Color(1, 1, 1)  # Resets color to white upon spawn
	color_rect.color = current_color

extends Area2D

@export var SPEED = 7.5

@export_group("Controls")
@export var left : Key = KEY_LEFT
@export var right : Key = KEY_RIGHT

func _physics_process(_delta):
	if Input.is_key_pressed(left):
		position.x -= SPEED
	if Input.is_key_pressed(right):
		position.x += SPEED

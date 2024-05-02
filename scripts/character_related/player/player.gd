class_name Player
extends CharacterBody2D


@export var movement_speed: float = 300.0
@export var gravity: float = 30.0
@export var jump_force = [1000, 850]

var jump_count = 0

func _physics_process(_delta: float) -> void:
	var horizontal_input = Input.get_axis("MoveLeft", "MoveRight")

	velocity.x = horizontal_input * movement_speed
	velocity.y += gravity

	if Input.is_action_just_pressed("Jump") and jump_count < jump_force.size():
		velocity.y = -jump_force[jump_count]
		jump_count += 1
	elif is_on_floor():
		jump_count = 0
	
	move_and_slide()

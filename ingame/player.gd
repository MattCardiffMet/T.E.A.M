extends CharacterBody2D

@export var speed = 250

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("game_left", "game_right", "game_up", "game_down")
	velocity = direction * speed
	move_and_slide()

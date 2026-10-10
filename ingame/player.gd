extends CharacterBody2D

@export var speed = 200
@onready var chara_sprite = $Sprite2D

func _ready() -> void:
	chara_sprite.texture = load("res://character select/assets/" + Global.chara + ".png")
	
	match Global.chara:
		"Thor":
			speed = 200
		"Thyra":
			speed = 250
		"Merlin":
			speed = 200
		"Questor":
			speed = 300

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("game_left", "game_right", "game_up", "game_down")
	velocity = direction * speed
	move_and_slide()

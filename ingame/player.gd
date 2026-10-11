extends CharacterBody2D

@export var speed = 200
@export var health = 1000
@onready var chara_sprite = $Sprite2D

func _ready() -> void:
	chara_sprite.texture = load("res://ingame/assets/" + Global.chara + ".png")
	
	match Global.chara:
		"Thor":
			speed = 200
			health = 900
		"Thyra":
			speed = 250
			health = 1000
		"Merlin":
			speed = 200
			health = 800
		"Questor":
			speed = 300
			health = 850

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("game_left", "game_right", "game_up", "game_down")
	
	if direction != Vector2.ZERO:
		var angle = snappedf(direction.angle(), PI / 4)
		direction = Vector2.from_angle(angle)
		chara_sprite.rotation = angle - PI / 2
	
	velocity = direction * speed
	move_and_slide()

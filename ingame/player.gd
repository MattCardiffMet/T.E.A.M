extends CharacterBody2D

@export var speed = 200
@export var health = 1000
@onready var chara_sprite = $Sprite2D

var facing = Vector2.DOWN
var projectile_load = preload("res://ingame/projectiles/projectile.tscn")

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
		"Test":
			speed = 500
			health = 100

func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("game_left", "game_right", "game_up", "game_down")
	
	# if any of you decide to touch this please read this first 
	# https://www.reddit.com/r/godot/comments/t206my/how_to_get_a_direction_from_a_vector2d/
	if direction != Vector2.ZERO:
		var angle = snappedf(direction.angle(), PI / 4)
		direction = Vector2.from_angle(angle)
		chara_sprite.rotation = angle - PI / 2
		facing = direction
	
	if Input.is_action_just_pressed("game_shoot"):
		shoot()
	
	velocity = direction * speed
	move_and_slide()

func shoot():
	var projectile = projectile_load.instantiate()
	projectile.position = position
	projectile.direction = facing
	projectile.rotation = facing.angle()
	get_parent().add_child(projectile)

func take_damage(num):
	health -= num
	print("hp: ", health)
	if health <= 0:
		# TODO: make game over later (for now it just goes back to lobby)
		get_tree().change_scene_to_file.call_deferred("res://main menu/main_menu.tscn")

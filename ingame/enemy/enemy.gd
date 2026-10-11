extends CharacterBody2D

@export var damage = 20
@export var health = 115
@export var points_given = 100
@export var move_speed = 100

@onready var hitbox = $Hitbox
@onready var player = get_tree().current_scene.get_node("Player")
var cooldown = 0.0

func _ready() -> void:
	add_to_group("enemies")
	
func take_damage(num):
	health -= num
	print("Enemy health reduced: ", health)
	if health <= 0:
		Global.score += points_given
		queue_free()

func _physics_process(delta: float) -> void:
	var direction = (player.position - position).normalized()
	velocity = direction * move_speed
	move_and_slide()
	
	cooldown -= delta
	if cooldown <= 0:
		for body in hitbox.get_overlapping_bodies():
			if body.is_in_group("player"):
				body.take_damage(damage)
				cooldown = 1.0

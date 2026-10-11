extends Area2D

@export var damage = 20
@export var health = 115
@export var points_given = 100
@export var move_speed = 100

@onready var player = get_tree().current_scene.get_node("Player")
var cooldown = 0.0

func _ready() -> void:
	add_to_group("enemies")
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)

func take_damage(damage):
	health -= damage
	print("Enemy health reduced: ", health)
	if health <= 0:
		Global.score += points_given
		queue_free()

func _physics_process(delta: float) -> void:
	var direction = (player.position - position).normalized()
	position += direction * move_speed * delta

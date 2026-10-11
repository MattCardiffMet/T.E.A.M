extends Area2D

@export var damage = 20
@export var health = 100

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)

func take_damage(damage):
	health -= damage
	print("Enemy health reduced: ", health)

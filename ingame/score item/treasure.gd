extends Area2D

@onready var hitbox = $Hitbox

func _ready() -> void:
	hitbox.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("player"):
		Global.score += 500
		queue_free()

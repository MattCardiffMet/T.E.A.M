extends Area2D

@export var speed = 200
@export var damage = 50

var direction = Vector2.DOWN

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	await get_tree().create_timer(2.0).timeout
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	position += direction * speed * delta

func _on_area_entered(area):
	if area.has_method("take_damage"):
		area.take_damage(damage)
	queue_free()

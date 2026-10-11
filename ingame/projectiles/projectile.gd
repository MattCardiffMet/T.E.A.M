extends Area2D

@export var speed = 200
@export var damage = 50
@onready var projectile_sprite = $Sprite2D

var direction = Vector2.DOWN

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	body_entered.connect(_on_body_entered)
	await get_tree().create_timer(2.0).timeout
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	projectile_sprite.texture = load("res://ingame/projectiles/assets/" + Global.chara + ".png")
	match Global.chara:
		"Thor":
			speed = 250
			damage = 55
		"Thyra":
			speed = 325
			damage = 35
		"Merlin":
			speed = 400
			damage = 40
		"Questor":
			speed = 400
			damage = 30
	
	position += direction * speed * delta

func _on_area_entered(area):
	if area.has_method("take_damage"):
		area.take_damage(damage)
	queue_free()

func _on_body_entered(body):
	if not body.has_method("take_damage"):
		queue_free()

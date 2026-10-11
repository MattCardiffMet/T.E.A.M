extends Area2D

@export var health = 300
@export var points = 300

@onready var spawner_sprite = $Sprite2D
@onready var timer = $Timer
var enemy_scene = preload("res://ingame/enemy/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(spawn)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func spawn():
	if get_tree().get_nodes_in_group("enemies").size() < 20:
		var enemy = enemy_scene.instantiate()
		get_parent().add_child(enemy)
		enemy.position = position

func take_damage(dmg):
	health -= dmg
	
	if health <= 0:
		Global.score += points
		queue_free()
	elif health <= 100:
			spawner_sprite.texture = load("res://ingame/spawner/assets/spawner_lowhp.png")

extends Area2D

@onready var trigger = $Trigger

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	trigger.body_entered.connect(_on_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://main menu/main_menu.tscn")

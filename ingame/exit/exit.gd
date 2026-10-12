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
		var current_level = Global.current_level
		# error & test world checks
		if Global.current_level == 0:
			get_tree().change_scene_to_file.call_deferred("res://outgame/end.tscn")
		if Global.current_level == 444:
			get_tree().change_scene_to_file.call_deferred("res://outgame/end.tscn")
		if Global.current_level >= 3:
				get_tree().change_scene_to_file.call_deferred("res://outgame/end.tscn")
				return
		elif Global.current_level >= 1:
			var next_level = str(Global.current_level + 1)
			get_tree().change_scene_to_file.call_deferred("res://story/story" + next_level + ".tscn")

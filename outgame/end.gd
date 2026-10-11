extends Control

@onready var CharaIcon = $CharaIcon
@onready var hsLabel = $VBoxContainer/HighscoreLabel
@onready var charaLabel = $VBoxContainer/CharaLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CharaIcon.texture = load("res://character select/assets/" + Global.chara + ".png")
	hsLabel.text = "Score:\n " + str(Global.score)
	charaLabel.text = str(Global.chara)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _unhandled_input(event):
	if event.is_action_pressed("menu_accept") or event.is_action_pressed("menu_quit"):
		get_tree().change_scene_to_file("res://main menu/main_menu.tscn") 

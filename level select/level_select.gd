extends Control

@onready var chara_icon = $CharaIcon
@onready var chara_label = $CharaLabel

@onready var story_label = $LabelVContainer/StoryLabel
@onready var test_label = $LabelVContainer/TestLabel

@onready var story_arrow = $ArrowVContainer/StoryArrow
@onready var test_arrow = $ArrowVContainer/TestArrow

var on_story = true

func _ready() -> void:
	chara_icon.texture = load("res://character select/assets/" + Global.chara + ".png")
	chara_label.text = str(Global.chara)
	update_arrows()

func _unhandled_key_input(event) -> void:
	if event.is_action_pressed("menu_down"):
		on_story = false
		update_arrows()
	elif event.is_action_pressed("menu_up"):
		on_story = true
		update_arrows()
	elif event.is_action_pressed("menu_accept"):
		if on_story:
			get_tree().change_scene_to_file("res://main menu/main_menu.tscn")
		elif not on_story:
			get_tree().change_scene_to_file("res://ingame/game.tscn")

func update_arrows():
	if on_story:
		story_arrow.text = ">>"
	else:
		story_arrow.text = ""
		
	if not on_story:
		test_arrow.text = ">>"
	else:
		test_arrow.text = ""

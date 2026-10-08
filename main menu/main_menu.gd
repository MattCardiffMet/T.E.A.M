extends Control

@onready var ArrowStart = $ArrowStart
@onready var ArrowExit = $ArrowExit
var arrow_on_play = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_arrows()

func _unhandled_input(event):
	# menu arrow handling
	if event.is_action_pressed("menu_down"):
		arrow_on_play = false
		update_arrows()
	elif event.is_action_pressed("menu_up"):
		arrow_on_play = true
		update_arrows()
		
	# button handling
	elif event.is_action_pressed("menu_accept"):
		if arrow_on_play:
			# TODO: ADD CHARA SELECT SCENE
			get_tree().change_scene_to_file("res://character select/character_select.tscn") 
		else:
			get_tree().quit()
	elif event.is_action_pressed("menu_quit"):
		get_tree().quit()

# this "moves" the menu arrows
func update_arrows():
	ArrowStart.visible = arrow_on_play
	ArrowExit.visible = not arrow_on_play

extends Control

@onready var arrowThor = $Arrows/ArrowThor
@onready var arrowThyra = $Arrows/ArrowThyra
@onready var arrowMerlin = $Arrows/ArrowMerlin
@onready var arrowQuestor = $Arrows/ArrowQuestor
var select = 0

func _ready() -> void:
	update_arrows()

func _unhandled_input(event):
	if event.is_action_pressed("menu_right"):
		select = wrapi(select + 1,0,4)
		update_arrows()
	elif event.is_action_pressed("menu_left"):
		select = wrapi(select - 1,0,4)
		update_arrows()
	elif event.is_action_pressed("menu_accept"):
		# TODO: choose_character()
		print("select character ", select)
	elif event.is_action_pressed("menu_quit"):
		get_tree().change_scene_to_file("res://main menu/main_menu.tscn")

func update_arrows():
	arrowThor.visible = false
	arrowThyra.visible = false
	arrowMerlin.visible = false
	arrowQuestor.visible = false
	
	match select:
		0:
			arrowThor.visible = true
		1:
			arrowThyra.visible = true
		2:
			arrowMerlin.visible = true
		3:
			arrowQuestor.visible = true

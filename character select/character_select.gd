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
		choose_character()
		print("chara chosen")
		get_tree().change_scene_to_file("res://ingame/game.tscn")
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

func choose_character():
	match select:
		0:
			Global.chara = "Thor"
		1:
			Global.chara = "Thyra"
		2:
			Global.chara = "Merlin"
		3:
			Global.chara = "Questor"
	

	

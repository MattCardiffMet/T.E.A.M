extends CanvasLayer

@onready var player = $"../.."
@onready var name_label = $VBoxContainer/NameLabel
@onready var health_label = $VBoxContainer/HealthLabel
@onready var score_label = $VBoxContainer/ScoreLabel
@onready var keys_label = $VBoxContainer/KeysLabel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	name_label.text = Global.chara
	health_label.text = "Health\n " +str(player.health)
	score_label.text = "Score:\n " + str(Global.score)
	keys_label.text = "Keys:\n " + str(Global.keys)

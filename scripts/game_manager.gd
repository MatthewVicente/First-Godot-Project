extends Node

var score = 0

@onready var score_label = $ScoreLabel

func _ready():
	if OS.has_feature("dedicated_server"):
		MultiplayerManager.become_host()

func add_point():
	score += 1
	score_label.text = 'You got ' + str(score) + ' coins.'

func become_host():	
	%MultiplayerHUD.hide()
	MultiplayerManager.become_host()
	
func join_as_player_2():
	%MultiplayerHUD.hide()
	MultiplayerManager.join_as_player_2()

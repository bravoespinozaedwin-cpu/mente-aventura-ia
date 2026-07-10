extends Node

@onready var player = $"../Player"

func _ready():
	player.can_move = true

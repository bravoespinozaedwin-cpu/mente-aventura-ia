extends Node

signal dialogue_started(text: String)
signal dialogue_finished

var is_dialogue_active: bool = false

func show_dialogue(text: String):
	is_dialogue_active = true
	dialogue_started.emit(text)

func hide_dialogue():
	is_dialogue_active = false
	dialogue_finished.emit()

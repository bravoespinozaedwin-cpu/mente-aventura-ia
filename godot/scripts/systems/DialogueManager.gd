extends Node

signal dialogue_started(text: String)
signal dialogue_finished

func show_dialogue(text: String):
	dialogue_started.emit(text)

func hide_dialogue():
	dialogue_finished.emit()

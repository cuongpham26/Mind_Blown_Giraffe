extends Control

@onready var button = $AudioStreamPlayer
@onready var start_button = $StartButton
@onready var quit_button = $QuitButton
@onready var options_button = $OptionsButton

func _on_start_button_pressed() -> void:
	button.play()
	await button.finished
	get_tree().change_scene_to_file("res://Scenes/select.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_options_button_pressed() -> void:
	button.play()
	await button.finished
	get_tree().change_scene_to_file("res://Scenes/settings.tscn")

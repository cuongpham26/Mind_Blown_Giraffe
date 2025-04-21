extends Control

@onready var button = $AudioStreamPlayer
@onready var start_button = $StartButton
@onready var quit_button = $QuitButton
@onready var options_button = $OptionsButton

var is_playing = false

func _on_start_button_pressed() -> void:
	if is_playing:
		return
	is_playing = true
	start_button.disabled = true
	button.play()
	await button.finished
	get_tree().change_scene_to_file("res://Scenes/main_select_screen.tscn")
	is_playing = false
	start_button.disabled = false

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _on_options_button_pressed() -> void:
	if is_playing:
		return
	is_playing = true
	options_button.disabled = true
	button.play()
	await button.finished
	get_tree().change_scene_to_file("res://Scenes/options_screen.tscn")
	is_playing = false
	options_button.disabled = false

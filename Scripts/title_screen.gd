extends Control

@onready var button = $AudioStreamPlayer

func _on_start_button_pressed() -> void:
	button.play()
	await button.finished
	get_tree().change_scene_to_file("res://Scenes/main_select_screen.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_options_button_pressed() -> void:
	button.play()
	await button.finished
	get_tree().change_scene_to_file("res://Scenes/options_screen.tscn")

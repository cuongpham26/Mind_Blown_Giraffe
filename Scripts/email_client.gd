extends Control

@onready var button = $BackButton/AudioStreamPlayer
@onready var mouse = $AudioStreamPlayer


func _on_back_button_pressed() -> void:
	button.play()
	await button.finished
	get_tree().change_scene_to_file("res://Scenes/main_select_screen.tscn")
	
func _on_order_button_pressed() -> void:
	mouse.play()
	await mouse.finished
	get_tree().change_scene_to_file("res://Scenes/yapping.tscn")

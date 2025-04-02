extends Control

@onready var mouse_clicked = $MouseButton/AudioStreamPlayer2D
@onready var keys = $KeysButton/AudioStreamPlayer2D

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")


func _on_mouse_button_pressed() -> void:
	mouse_clicked.play()
	await mouse_clicked
	get_tree().change_scene_to_file("res://Scenes/collage_editor.tscn")


func _on_free_collage_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/collage_editor.tscn")


func _on_keys_button_pressed() -> void:
	keys.play()
	await keys.finished
	get_tree().change_scene_to_file("res://Scenes/store.tscn")  

	  
	

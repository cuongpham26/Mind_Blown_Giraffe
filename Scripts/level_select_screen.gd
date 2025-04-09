extends Control

@onready var mouse_clicked = $MouseButton/AudioStreamPlayer
@onready var keys = $KeysButton/AudioStreamPlayer
@onready var paper = $FreeCollageButton/AudioStreamPlayer
@onready var button = $BackButton/AudioStreamPlayer

func _on_back_button_pressed() -> void:
	button.play()
	await button.finished
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")


func _on_mouse_button_pressed() -> void:
	mouse_clicked.play()
	await mouse_clicked.finished
	get_tree().change_scene_to_file("res://Scenes/email.tscn")


func _on_free_collage_button_pressed() -> void:
	paper.play()
	await paper.finished
	get_tree().change_scene_to_file("res://Scenes/collage_editor.tscn")


func _on_keys_button_pressed() -> void:
	keys.play()
	await keys.finished
	get_tree().change_scene_to_file("res://Scenes/store.tscn")  

	  
	

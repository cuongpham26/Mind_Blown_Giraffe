extends Control

@onready var button = $BackButton/AudioStreamPlayer
@onready var mouse = $AudioStreamPlayer

@onready var back_button = $BackButton
@onready var order_button = $OrderButton

var is_playing = false 

func _on_back_button_pressed() -> void:
	if is_playing:
		return
	is_playing = true 
	back_button.disabled = true
	button.play()
	await button.finished
	get_tree().change_scene_to_file("res://Scenes/main_select_screen.tscn")
	is_playing = false
	back_button.disabled = false 
	
func _on_order_button_pressed() -> void:
	if is_playing:
		return
	is_playing = true
	order_button.disabled = true 
	mouse.play()
	await mouse.finished
	get_tree().change_scene_to_file("res://Scenes/yapping.tscn")
	is_playing = false
	order_button.disabled = false

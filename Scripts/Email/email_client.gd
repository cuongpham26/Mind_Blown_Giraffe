extends Control

@onready var back_button_audio: AudioStreamPlayer = $BackButton/AudioStreamPlayer
@onready var order_button_audio1: AudioStreamPlayer = $OrderButton1/AudioStreamPlayer
@onready var order_button_audio2: AudioStreamPlayer = $OrderButton2/AudioStreamPlayer

func _on_back_button_pressed() -> void:
	back_button_audio.play()
	await back_button_audio.finished
	get_tree().change_scene_to_file("res://Scenes/select.tscn")
	
func _on_order_button_1_pressed() -> void:
	order_button_audio1.play()
	await order_button_audio1.finished
	get_tree().change_scene_to_file("res://Scenes/yapping1.tscn")

func _on_order_button_2_pressed() -> void:
	order_button_audio2.play()
	await order_button_audio2.finished
	get_tree().change_scene_to_file("res://Scenes/yapping2.tscn")

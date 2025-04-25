extends Control

@onready var back_button_audio: AudioStreamPlayer = $BackButton/AudioStreamPlayer
@onready var order_button_audio: AudioStreamPlayer = $OrderButton/AudioStreamPlayer

func _on_back_button_pressed() -> void:
	back_button_audio.play()
	await back_button_audio.finished
	get_tree().change_scene_to_file("res://Scenes/select.tscn")
	
func _on_order_button_pressed() -> void:
	order_button_audio.play()
	await order_button_audio.finished
	get_tree().change_scene_to_file("res://Scenes/yapping.tscn")

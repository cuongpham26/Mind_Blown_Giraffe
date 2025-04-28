extends Control

@onready var volume_slider = $VolumeSlider
@onready var button = $AudioStreamPlayer
@onready var back_button = $BackButton

func _ready() -> void:
	volume_slider.value = 0.5  # Set the slider to the middle value
	MusicPlayer.set_volume(0.5)  # Optional: also set volume at start

func _on_volume_slider_value_changed(value: float) -> void:
	MusicPlayer.set_volume(value)

func _on_back_button_pressed() -> void:
	button.play()
	await button.finished
	get_tree().change_scene_to_file("res://Scenes/title.tscn")

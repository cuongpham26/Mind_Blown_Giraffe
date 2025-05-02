extends Node

var audio_player: AudioStreamPlayer
var volume_slider: HSlider

func _ready() -> void:
	audio_player = AudioStreamPlayer.new()
	add_child(audio_player)
	var music = preload("res://Music/mbg main theme demo.mp3")
	audio_player.stream = music
	audio_player.play()

	# Enable looping
	audio_player.stream.loop = true  # Set the loop property to true for the music

	audio_player.volume_db = linear_to_db(1.0)

func set_volume(value) -> void:
	var clamped_value = clamp(value, 0.0, 1.0)
	audio_player.volume_db = linear_to_db(clamped_value)

extends Control

@onready var mouse_button: TextureButton = $MouseButton
@onready var keys_button: TextureButton = $KeysButton
@onready var free_collage_button: TextureButton = $FreeCollageButton
@onready var back_button: Button = $BackButton

@onready var mouse_audio: AudioStreamPlayer = $MouseButton/AudioStreamPlayer
@onready var keys_audio: AudioStreamPlayer = $KeysButton/AudioStreamPlayer
@onready var free_collage_audio: AudioStreamPlayer = $FreeCollageButton/AudioStreamPlayer
@onready var button_audio: AudioStreamPlayer = $BackButton/AudioStreamPlayer

var is_playing: bool = false 

func _ready() -> void:
	back_button.pressed.connect(_on_back_button_pressed)
	free_collage_button.pressed.connect(_on_free_collage_button_pressed)
	keys_button.pressed.connect(_on_keys_button_pressed)
	mouse_button.pressed.connect(_on_mouse_button_pressed)	

func _on_back_button_pressed() -> void:
	if is_playing: return
	is_playing = true 
	back_button.disabled = true
	button_audio.play()
	await button_audio.finished
	get_tree().change_scene_to_file("res://Scenes/title.tscn")


func _on_free_collage_button_pressed() -> void:
	if is_playing:
		return
	is_playing = true
	free_collage_button.disabled = true
	free_collage_audio.play()
	await free_collage_audio.finished
	get_tree().change_scene_to_file("res://Scenes/collage.tscn")
	

func _on_keys_button_pressed() -> void:
	if is_playing:
		return
	is_playing = true
	keys_button.disabled = true
	keys_audio.play()
	await keys_audio.finished
	get_tree().change_scene_to_file("res://Scenes/store.tscn") 


func _on_mouse_button_pressed() -> void:
	if is_playing: 
		return 
	is_playing = true
	mouse_button.disabled = true 
	mouse_audio.play()
	await mouse_audio.finished
	get_tree().change_scene_to_file("res://Scenes/email.tscn")
	

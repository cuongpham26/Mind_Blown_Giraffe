extends Control

@onready var back_button_audio: AudioStreamPlayer = $BackButton/AudioStreamPlayer
@onready var order_button_1_audio: AudioStreamPlayer = $OrderButton1/AudioStreamPlayer
@onready var order_button_2_audio: AudioStreamPlayer = $OrderButton2/AudioStreamPlayer
@onready var order_button_3_audio: AudioStreamPlayer = $OrderButton3/AudioStreamPlayer
@onready var order_button_4_audio: AudioStreamPlayer = $OrderButton4/AudioStreamPlayer

@onready var backButton = $BackButton
@onready var Order1 = $OrderButton1
@onready var Order2 = $OrderButton2
@onready var Order3 = $OrderButton3
@onready var Order4 = $OrderButton4

var is_playing = false

func _on_back_button_pressed() -> void:
	if is_playing:
		return
	is_playing = true
	backButton.disabled = true
	back_button_audio.play()
	await back_button_audio.finished
	get_tree().change_scene_to_file("res://Scenes/select.tscn")

func _on_order_button_1_pressed() -> void:
	if is_playing:
		return
	is_playing = true
	Order1.disabled = true
	order_button_1_audio.play()
	await order_button_1_audio.finished
	get_tree().change_scene_to_file("res://Scenes/yapping1.tscn")
	
func _on_order_button_2_pressed() -> void:
	if is_playing:
		return
	is_playing = true
	Order2.disabled = true
	order_button_2_audio.play()
	await order_button_2_audio.finished
	get_tree().change_scene_to_file("res://Scenes/yapping2.tscn")

func _on_order_button_3_pressed() -> void:
	if is_playing:
		return
	is_playing = true
	Order3.disabled = true
	order_button_3_audio.play()
	await order_button_3_audio.finished
	get_tree().change_scene_to_file("res://Scenes/yapping3.tscn")

func _on_order_button_4_pressed() -> void:
	if is_playing:
		return
	is_playing = true
	Order4.disabled = true
	order_button_4_audio.play()
	await order_button_4_audio.finished
	get_tree().change_scene_to_file("res://Scenes/yapping4.tscn")

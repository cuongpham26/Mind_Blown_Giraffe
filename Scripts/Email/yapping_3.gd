@tool
extends Control

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $King
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer
@onready var canvas_button: Button = $GoToCanvas

var is_playing: bool = false

func _ready() -> void:
	canvas_button.pressed.connect(_on_go_to_canvas_pressed)
	get_node("Timer").timeout.connect(_on_timer_timeout)
	sprite.texture = preload("res://Characters/King/King 1.png")
	animation.play("talking_king")
	$Timer.start(5.0)

func _on_go_to_canvas_pressed() -> void:
	if is_playing: return
	is_playing = true
	canvas_button.disabled = true
	audio.play() 
	await audio.finished
	get_tree().change_scene_to_file("res://Scenes/collage.tscn")

func _on_timer_timeout() -> void:
	animation.stop()
	sprite.texture = preload("res://Characters/King/King 1.png")

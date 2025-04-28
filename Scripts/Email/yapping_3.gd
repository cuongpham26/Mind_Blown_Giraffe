

extends Control

@onready var animation = $AnimationPlayer

@onready var sprite = $King

@onready var click = $AudioStreamPlayer

@onready var canvas_button = $GoToCanvas

var is_playing = false

func _on_go_to_canvas_pressed() -> void:
	click.play()
	await click.finished
	get_tree().change_scene_to_file("res://Scenes/collage.tscn")
	
func _ready() -> void:
	sprite.texture = preload("res://Characters/King/King 1.png")
	animation.play("talking_king")
	$Timer.start(5.0)

func _on_timer_timeout() -> void:
	animation.stop()
	sprite.texture = preload("res://Characters/King/King 1.png")

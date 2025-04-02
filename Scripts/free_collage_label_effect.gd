extends Label

@export var speed: float = 2.0  # Speed of pulsation
@export var scale_amount: float = 0.05  # Subtle pulsing

var time: float = 0.0

func _ready() -> void:
	# Set the pivot offset to the center of the Label
	pivot_offset = size / 2

func _process(delta: float) -> void:
	time += delta * speed
	var scale_factor = 1.0 + sin(time) * scale_amount  # Smooth pulsation
	scale = Vector2(scale_factor, scale_factor)  # Apply scaling

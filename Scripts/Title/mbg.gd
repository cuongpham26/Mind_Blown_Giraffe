extends Sprite2D

var angle_amount: int = 20 # max degrees to rotate (you can make this smaller)
var speed: int = 2 # how fast it rotates back and forth
var time_passed: float = 0.0

func _process(delta: float):
	time_passed += delta
	rotation_degrees = sin(time_passed * speed) * angle_amount

extends Sprite2D

var angle_amount = 20 # max degrees to rotate (you can make this smaller)
var speed = 2 # how fast it rotates back and forth
var time_passed = 0.0

func _process(delta):
	time_passed += delta
	rotation_degrees = sin(time_passed * speed) * angle_amount

extends Sprite2D

@onready var background: Sprite2D = get_node("../../Background")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and get_rect().has_point(to_local(event.position)): 			
			# We plan to release this game on a 1280 * 720 computer screen
			var target_width: float = 1280
			var target_height: float = 720
			
			var texture_width: float = texture.get_width()
			var texture_height: float = texture.get_height()

			# Same scaling rule: fit inside 160x160, at least one side = 160
			var scale_x: float = target_width / texture_width
			var scale_y: float = target_height / texture_height

			background.set_texture(texture)
			background.scale = Vector2(scale_x, scale_y)

extends Sprite2D
 
var mouse_offset: Vector2  # Denotes the vector from sprite position to mouse position
var is_original: bool = true  # Only original Sidebar images can duplicate
var highlighted: bool = false
var mission = Mission.new()
var file_path: String
static var z_score: int = 0
@onready var background: Sprite2D = get_node("../../Background")

func _input(event: InputEvent) -> void:
	# Allow duplication only if the sprite is inside the Sidebar and is an original
	if event is InputEventMouseButton and event.pressed and get_rect().has_point(to_local(event.position)) and is_original:
		var new_sprite: Sprite2D = duplicate()
		new_sprite.global_position += Vector2(250, 200)
		new_sprite.is_original = false  # Mark duplicate as non-original
		z_score += 1
		new_sprite.z_index = z_score
		background.get_parent().add_child(new_sprite)
		
		file_path = new_sprite.get_texture().load_path.get_file().get_slice("-", 0)
		mission.add_asset(file_path)
			
	# Drag and highlight
	if event is InputEventMouseButton and get_rect().has_point(to_local(event.position)) \
	and not is_original:
		if event.pressed:
			highlighted = true
			set_self_modulate(Color(1,1,1,.5))
			z_score += 1
			z_index = z_score
			mouse_offset = to_local(event.position) - get_rect().position
		else:
			set_self_modulate(Color(1,1,1,1))
			highlighted = false

func _process(_delta: float) -> void:
	# Item mutators
	if highlighted:
		if Input.is_action_just_pressed("ui_left"):
			rotation_degrees -= 30
		if Input.is_action_just_pressed("ui_right"):
			rotation_degrees += 30
		if Input.is_action_just_pressed("ui_text_indent"):
			var flipped = is_flipped_h()
			set_flip_h(!flipped)
		if Input.is_action_just_pressed("ui_up"):
			scale *= 2
		if Input.is_action_just_pressed("ui_down"):
			scale *= .5
		if Input.is_action_just_pressed("ui_text_backspace"):
			mission.remove_asset(file_path)
			queue_free()
		
		global_position = get_global_mouse_position() - mouse_offset  # Move directly for smoother dragging

extends Sprite2D
 
# Drag and drop variables
var draggable: bool = false
var mouse_offset: Vector2
var delay: float = .2
var is_original: bool = true  # Only original Sidebar images can duplicate
var tween: Tween = null  # Store the tween instance
var highlighted: bool = false
var mission = Mission.new()
var file_path: String
@onready var background: Sprite2D = get_node("../../../Background")

func _input(event: InputEvent) -> void:
	# Allow duplication only if the sprite is inside the Sidebar and is an original
	if event is InputEventMouseButton and event.pressed and get_rect().has_point(to_local(event.position)): 
		if is_original and get_parent() and get_parent().get_parent().name == "ItemPanel" and get_parent().is_visible():
			var new_sprite: Sprite2D = duplicate()
			new_sprite.global_position += Vector2(250, 200)
			new_sprite.is_original = false  # Mark duplicate as non-original
			
			background.get_parent().add_child(new_sprite)
			
			file_path = new_sprite.get_texture().load_path.get_file().get_slice("-", 0)
			mission.add_asset(file_path)
			
	# Drag and highlight
	if event is InputEventMouseButton and get_rect().has_point(to_local(event.position)) \
	and not is_original:
		if event.pressed:
			highlighted = true
			draggable = true
			mouse_offset = get_global_mouse_position() - global_position
		else:
			draggable = false
			highlighted = false

func _process(_delta: float) -> void:
	# Item mutators
	if highlighted:
		set_self_modulate(Color(1,1,1,.5))
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
	if not highlighted:
		set_self_modulate(Color(1,1,1,1))
	if draggable:
		global_position = get_global_mouse_position() - mouse_offset  # Move directly for smoother dragging

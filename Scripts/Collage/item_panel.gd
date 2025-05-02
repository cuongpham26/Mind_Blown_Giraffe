@tool
extends Panel

@onready var itemOne: Sprite2D = $Item1
@onready var itemTwo: Sprite2D = $Item2
@onready var itemThree: Sprite2D = $Item3
@onready var itemFour: Sprite2D = $Item4
@onready var itemFive: Sprite2D = $Item5

var item_keys : Array = Asset.new().items.keys()
var item_index: int = 0
var item_count: int = 0
const ITEMS_PER_PAGE: int = 5
var mission = Mission.new()
var file_path: String
static var max_z_score: int = 0

func _ready() -> void:
	get_node("PrevButton").pressed.connect(_on_prev_button_pressed)
	get_node("NextButton").pressed.connect(_on_next_button_pressed)
	update_items()

func _on_prev_button_pressed() -> void:
	if item_index >= ITEMS_PER_PAGE:
		item_index -= ITEMS_PER_PAGE
		update_items()

func _on_next_button_pressed() -> void:
	# Make sure we don't overflow past the last item
	if item_index + ITEMS_PER_PAGE < item_keys.size():
		item_index += ITEMS_PER_PAGE
		update_items()

func update_items() -> void:
	set_sprite_texture(itemOne, item_index)
	set_sprite_texture(itemTwo, item_index + 1)
	set_sprite_texture(itemThree, item_index + 2)
	set_sprite_texture(itemFour, item_index + 3)
	set_sprite_texture(itemFive, item_index + 4)

func set_sprite_texture(sprite: Sprite2D, index: int) -> void:
	if index < item_keys.size():
		var filename = item_keys[index]
		var texture = load("res://Inventory/Items/" + filename)
		sprite.texture = texture
		
		if texture:
			var max_width: float = 160.0
			var max_height: float = size[1]
			var texture_width = texture.get_width()
			var texture_height = texture.get_height()

			# Choose the smaller scale factor
			var final_scale: float = min(max_width / texture_width,  max_height / texture_height)

			# Apply uniform scaling to preserve aspect ratio
			sprite.scale = Vector2(final_scale, final_scale)
	else:
		sprite.texture = null # Clear sprite if no image
 
func _input(event: InputEvent) -> void:
	var original_item_list: Array = get_children().filter(func(node): return node.name.match("Item*"))
	var created_item_list: Array = get_parent().get_children().filter(func(node): return node.name.match("Item*") and node.name != "ItemPanel")
	# Allow duplication only if the sprite is inside the Sidebar and is an original
	if event is InputEventMouseButton and event.pressed:
		for item in original_item_list:
			if item.get_rect().has_point(item.to_local(event.position)):
				var new_sprite: Sprite2D = item.duplicate()
				item_count += 1
				new_sprite.name = "Item" + str(item_count+ITEMS_PER_PAGE)
				new_sprite.global_position += Vector2(250, 200)
				new_sprite.is_original = false  # Mark duplicate as non-original
				max_z_score += 1
				new_sprite.z_index = max_z_score
				get_parent().add_child(new_sprite, true)
				
				mission.add_asset(new_sprite.get_texture().load_path.get_file().get_slice("-", 0))
					
		for item in created_item_list:
			if item.get_rect().has_point(item.to_local(event.position)) and !item.highlighted:
				item.highlighted = true
				item.set_self_modulate(Color(1,1,1,.7))
				max_z_score += 1
				item.z_index = max_z_score
				item.mouse_offset = get_global_mouse_position() - item.global_position
			else:
				item.set_self_modulate(Color(1,1,1,1))
				item.highlighted = false

func _process(_delta: float) -> void:
	for item in get_parent().get_children().filter(func(node): return node.name.match("Item*") and node.name != "ItemPanel"):
		if item.highlighted:
			if Input.is_action_pressed("ui_left"):
				item.rotation_degrees -= 0.7
			if Input.is_action_pressed("ui_right"):
				item.rotation_degrees += 0.8
			if Input.is_action_just_pressed("ui_text_indent"):
				item.set_flip_h(!item.is_flipped_h())
			if Input.is_action_pressed("ui_up"):
				item.scale *= 1.03
			if Input.is_action_pressed("ui_down"):
				item.scale *= 0.97
			if Input.is_action_just_pressed("ui_text_backspace"):
				mission.remove_asset(item.get_texture().load_path.get_file().get_slice("-", 0))
				item.queue_free()

			item.global_position = get_global_mouse_position() - item.mouse_offset  # Move directly for smoother dragging

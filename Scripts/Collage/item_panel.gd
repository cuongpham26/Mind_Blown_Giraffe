extends Panel

@onready var itemOne: Sprite2D = $Item1
@onready var itemTwo: Sprite2D = $Item2
@onready var itemThree: Sprite2D = $Item3
@onready var itemFour: Sprite2D = $Item4
@onready var itemFive: Sprite2D = $Item5

var item_keys : Array = Asset.new().items.keys()
var item_index: int = 0
const ITEMS_PER_PAGE: int = 5

func _ready():
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

func update_items():
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
			var tex_width = texture.get_width()
			var tex_height = texture.get_height()

			# Find scale factors needed to match 160px in width and height
			var scale_x = max_width / tex_width
			var scale_y = max_height / tex_height

			# Choose the smaller scale factor
			var final_scale: float = min(scale_x, scale_y)

			# Apply uniform scaling to preserve aspect ratio
			sprite.scale = Vector2(final_scale, final_scale)
	else:
		sprite.texture = null # Clear sprite if no image

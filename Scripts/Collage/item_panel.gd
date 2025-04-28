extends Panel

@onready var itemOne: Sprite2D = $Item1
@onready var itemTwo: Sprite2D = $Item2
@onready var itemThree: Sprite2D = $Item3
@onready var itemFour: Sprite2D = $Item4
@onready var itemFive: Sprite2D = $Item5

var asset = Asset.new()

var item_keys: Array = [] # This will store all item filenames
var current_page: int = 0
const ITEMS_PER_PAGE: int = 5

func _ready():
	item_keys = asset.items.keys()
	update_items()

func _on_prev_button_pressed() -> void:
	current_page = max(current_page - 1, 0)
	update_items()

func _on_next_button_pressed() -> void:
	# Make sure we don't overflow past the last item
	if (current_page + 1) * ITEMS_PER_PAGE < item_keys.size():
		current_page += 1
	update_items()

func update_items():
	var start_index = current_page * ITEMS_PER_PAGE

	set_sprite_texture(itemOne, start_index + 0)
	set_sprite_texture(itemTwo, start_index + 1)
	set_sprite_texture(itemThree, start_index + 2)
	set_sprite_texture(itemFour, start_index + 3)
	set_sprite_texture(itemFive, start_index + 4)

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
			# So that neither width nor height exceeds 160px
			# and one will exactly hit 160
			var final_scale: float = min(scale_x, scale_y)

			# Apply uniform scaling to preserve aspect ratio
			sprite.scale = Vector2(final_scale, final_scale)
	else:
		sprite.texture = null # Clear sprite if no image

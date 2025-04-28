extends Node

class_name Asset

# ["Dark/Light", "Cool/Warm", "Sad/Happy", "Comforting/Inspiring"]

var items = {
	"02_dish_2.png": [4.0, -2.0, 0.0, -1.0],
	"15_burger.png": [1.0, 3.0, 2.0, -4.0],
	"16x32 trees 2.png": [1.0, 0.0, 3.0, -2.0],
	"16x32 trees 3.png": [-2.0, 0.0, 1.0, -2.0],
	"16x32 trees 4.png": [1.0, 0.0, 2.0, 1.0],
	"38_friedegg.png": [4.0, 1.0, 3.0, -3.0],
	"48x48 trees 2.png": [0.0, -1.0, 3.0, -2.0],
	"48x48 trees 3.png": [0.0, -1.0, 3.0, -2.0],
	"54_hotdog.png": [-1.0, 3.0, 2.0, -4.0],
	"81_pizza.png": [1.0, 4.0, 2.0, -3.0],
	"BirdFly.png": [0.0, 2.0, 2.0, 2.0],
	"Bunny.png": [1.0, 1.0, 3.0, 0.0],
	"Cattt.png": [1.0, 0.0, 3.0, -3.0],
	"FrogIdle.png": [2.0, -2.0, 3.0, 0.0],
	"Golden.png": [1.0, 1.0, 3.0, 0.0],
	"PlaceholderGlinko_scaled_16x_pngcrushed.png": [-2.0, 1.0, 3.0, -3.0],
	"Pig.png": [2.0, 2.0, 0.0, -2.0],
	"girl.png": [1.0, 2.0, 4.0, 2.0],
	"sargent_relish_large.png": [-2.0, -2.0, 3.0, 1.0],
	"shirt1.png": [4.0, -1.0, 4.0, 3.0],
	"unnamed.png": [1.0, 0.0, -2.0, 3.0],
}

var backgrounds = {
	"Art Texture 01.jpg": [2.0, -1.0, 1.0, 3.0],
	"Art Texture 011.jpg": [-2.0, 1.0, -3.0, 1.0],
	"Art Texture 014.jpg": [-2.0, 2.0, 0.0, 1.0],
	"Art Texture 020.jpg": [-2.0, -4.0, 0.0, 2.0],
	"Art Texture 027.jpg": [-3.0, -3.0, -1.0, 0.0],
	"Art Texture 034.JPG": [1.0, -3.0, 2.0, 0.0],
	"Art Texture 036.JPG": [-2.0, -3.0, 0.0, 4.0],
	"Art Texture 037.JPG": [3.0, -4.0, 0.0, 1.0],
	"Art Texture 052.JPG": [3.0, -4.0, -2.0, 0.0],
	"Art Texture 055.JPG": [4.0, 3.0, 1.0, 0.0],
	"Art Texture 056.JPG": [4.0, 1.0, 2.0, 0.0],
	"Art Texture 057.JPG": [-1.0, -3.0, -2.0, 0.0],
	"Art Texture 059.JPG": [4.0, -1.0, 2.0, 0.0],
	"Cloth_01-256x256.png": [-2.0, -4.0, -1.0, 0.0],
	"Cloth_02-256x256.png": [-2.0, 3.0, 0.0, -1.0],
	"Cloth_04-256x256.png": [3.0, 2.0, 0.0, -1.0],
	"Cloth_06-256x256.png": [-1.0, 3.0, 0.0, -2.0],
	"Cloth_07-256x256.png": [4.0, 2.0, 1.0, 0.0],
	"Cloth_10-256x256.png": [-1.0, 1.0, 0.0, -1.0],
	"Cloth_11-256x256.png": [3.0, 0.0, 1.0, -2.0],
	"Cloth_12-256x256.png": [3.0, 3.0, 1.0, -2.0],
	"Cloth_14-256x256.png": [3.0, -4.0, 0.0, -1.0],
	"Cloth_16-256x256.png": [3.0, -4.0, 0.0, -1.0],
	"Cloth_18-256x256.png": [-4.0, -4.0, 0.0, 1.0],
	"Cloth_19-256x256.png": [1.0, -3.0, 0.0, 1.0],
	"Cloth_22-256x256.png": [-2.0, 4.0, -1.0, 1.0],
	"Cloth_24-256x256.png": [3.0, 4.0, 0.0, -1.0],
	"color_background_34.png": [1.0, -4.0, -1.0, 0.0],
	"color_background_48.png": [1.0, 3.0, 1.0, -2.0],
	"color_background_47.png": [1.0, -2.0, 1.0, -1.0],
	"color_background_54.png": [2.0, 2.0, -1.0, 0.0],
	"color_background_58.png": [2.0, -3.0, 0.0, 1.0],
	"color_background_65.png": [2.0, -4.0, -1.0, 0.0],
	"color_background_66.png": [1.0, -4.0, 1.0, -1.0],
	"color_background_71.png": [4.0, 2.0, 1.0, 0.0],
	"color_background_76.png": [-3.0, -3.0, -1.0, 0.0],
	"color_background_77.png": [3.0, 4.0, 1.0, 0.0],
	"color_background_79.png": [-3.0, -3.0, -1.0, 0.0],
	"color_background_86.png": [2.0, 3.0, 4.0, -1.0]
}

func get_item_info(path: String):
	if items.has(path):
		return items.get(path)
	else:
		print("Item " + path + " does not exist")
		return [0.0, 0.0, 0.0, 0.0]

func get_background_info(path: String):
	if backgrounds.has(path):
		return items.get(path)
	else:
		print("Background " + path + " does not exist")
		return [0.0, 0.0, 0.0, 0.0]

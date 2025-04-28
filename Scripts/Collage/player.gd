# Player class + star grading
class_name Player

var name: String
var age: int = -1  # Default to -1 if not given
var stars: int = 0  # Star currency
var inventory: Array[String]
# Inventory only store the asset path, attributes are not included

func _init(p_name: String, p_age: int = -1):
	name = p_name
	age = p_age
	
func add_asset(asset: String) -> void:
	if asset in inventory:
		print("Asset already in inventory")
	else:
		inventory.append(asset)

func remove_asset(asset: String) -> void:
	if asset not in inventory:
		print("Asset not in inventory")
	else:
		inventory.erase(asset)
	
# Display player information
# Only here for now for testing purpose
# Will likely remove
func show_info():
	print("Player Name:", name)
	if age != -1:
		print("Age:", age)
	print("Stars:", stars)

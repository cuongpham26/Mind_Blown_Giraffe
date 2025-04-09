# Player class + star grading
@icon("../Icons/character.png")
class_name Player


var name: String
var age: int = -1  # Default to -1 if not given
var stars: int = 0  # Star currency
var inventory: Array[Item]
var interest

# Constructor
func _init(p_name: String, p_age: int = -1):
	name = p_name
	age = p_age
	
# Function to add an item to the player's inventory
func add_item(item: Item) -> void:
	if item in inventory:
		print("Item already in inventory")
	else:
		inventory.append(item)

# Function to remove an item from the player's inventory
func remove_item(item: Item) -> void:
	if item not in inventory:
		print("Item not in inventory")
	else:
		inventory.erase(item)

# Evaluate performance (Confidant always passes, Client can fail)
func evaluate_performance(score: int, is_confidant: bool) -> void:

	if is_confidant:
		if score < 20:
			stars += 1
		elif score < 40:
			stars += 2
		elif score < 60:
			stars += 3
		elif score < 80:
			stars += 4
		else:
			stars += 5
	else:
		if score < 30:
			stars += 0  # Fail
		elif score < 50:
			stars += 1
		elif score < 70:
			stars = 2
		elif score < 85:
			stars = 3
		elif score < 95:
			stars = 4
		else:
			stars = 5
	

# Display player information
# Only here for now for testing purpose
# Will likely remove
func show_info():
	print("Player Name:", name)
	if age != -1:
		print("Age:", age)
	if interest != "":
		print("Interest:", interest)
	print("Stars:", stars)

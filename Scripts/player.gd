# Player class + star grading
@icon("../Icons/character.png")
class_name Player

var name: String
var age: int = -1  # Default to -1 if not given
var interest: String = ""
var stars: int = 0  # Star currency

# Constructor
func _init(p_name: String, p_age: int = -1, p_interest: String = ""):
	name = p_name
	age = p_age
	interest = p_interest

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
# Will likely removefunc show_info():
	print("Player Name:", name)
	if age != -1:
		print("Age:", age)
	if interest != "":
		print("Interest:", interest)
	print("Stars:", stars)

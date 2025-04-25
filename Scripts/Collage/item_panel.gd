extends Panel

@onready var setOne: Control = $ItemSet1
@onready var setTwo: Control = $ItemSet2
@onready var setThree: Control = $ItemSet3
@onready var setFour: Control = $ItemSet4

func _ready() -> void:
	setOne.visible = true
	setTwo.visible = false
	setThree.visible = false
	setFour.visible = false

func _on_prev_button_pressed() -> void:
	if setFour.visible:
		setFour.visible = false
		setThree.visible = true
		
	elif setThree.visible:
		setThree.visible = false
		setTwo.visible = true
		
	elif setTwo.visible:
		setTwo.visible = false
		setOne.visible = true

func _on_next_button_pressed() -> void:
	if setOne.visible:
		setOne.visible = false
		setTwo.visible = true
		
	elif setTwo.visible:
		setTwo.visible = false
		setThree.visible = true
		
	elif setThree.visible:
		setThree.visible = false
		setFour.visible = true

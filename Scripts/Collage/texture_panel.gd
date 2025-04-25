extends Panel

@onready var setOne: Control = $Set1
@onready var setTwo: Control = $Set2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setOne.visible = true
	setTwo.visible = false

func _on_prev_set_pressed() -> void:
	setOne.visible = true
	setTwo.visible = false

func _on_next_set_pressed() -> void:
	setOne.visible = false
	setTwo.visible = true

extends StaticBody2D

@export var crate_color: Color = Color(0.474, 0.481, 0.223, 1.0)

@onready var crate_rect: ColorRect = %CrateRect

func _ready() -> void:
	crate_rect.color = crate_color

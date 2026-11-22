extends StaticBody2D

@export var crate_color: Color

@onready var crate_rect: ColorRect = $CrateRect

func _ready() -> void:
	crate_rect.color = crate_color

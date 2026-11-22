extends StaticBody2D

@onready var door_rect: ColorRect = %DoorRect

func _ready() -> void:
	collision_layer = 1

func _on_console_signal_restored() -> void:
	print("Door: Signal received")
	collision_layer = 4
	door_rect.color = Color(0.0, 1.0, 0.0, 1.0)

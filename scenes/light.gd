extends Node2D

@onready var light_body: ColorRect = %LightRect
@onready var light_source: PointLight2D = %PointLight2D

func _on_console_signal_restored() -> void:
	light_body.color = Color(0.0, 1.0, 0.0, 1.0)
	light_source.color = Color(0.0, 1.0, 0.0, 1.0)

extends Node2D

var attempts: int = 0
signal signal_restored
@export var required_attempts: int = 3
@onready var status_label: Label = %StatusLabel

func _ready() -> void:
	status_label.text = "Signal offline - 0/" + str(required_attempts) + " attempts"
	
func trying_connection() -> void:
	if attempts >= required_attempts:
		return
	else:
		attempts += 1
		status_label.text = "Connecting - " + str(attempts) + "/" + str(required_attempts) + " attempts"
		print(attempts)
		if attempts >= required_attempts:
			status_label.text = "Signal restored"
			emit_signal("signal_restored")

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("try_connection"):
		trying_connection()

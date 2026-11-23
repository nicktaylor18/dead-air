extends Node2D

var console_enabled: bool = false
var attempts: int = 0
signal attempt(attempts, required_attempts)
signal signal_restored
@export var required_attempts: int = 3
@onready var status_label: Label = %StatusLabel
@onready var attempt_label: Label = %AttemptLabel

func _ready() -> void:
	status_label.text = "Signal offline - 0/" + str(required_attempts) + " attempts"
	
func attempt_connection() -> void:
	if attempts >= required_attempts:
		return

	if console_enabled == true:
		attempts += 1
		status_label.text = "Connecting - " + str(attempts) + "/" + str(required_attempts) + " attempts"
		emit_signal("attempt")
		attempt.emit(attempts,required_attempts)
		
		if attempts >= required_attempts:
			status_label.text = "Signal restored"
			emit_signal("signal_restored")

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("try_connection"):
		attempt_connection()

func _on_console_area_body_entered(body: Node2D) -> void:
	console_enabled = true
	attempt_label.visible = true

func _on_console_area_body_exited(body: Node2D) -> void:
	console_enabled = false
	attempt_label.visible = false

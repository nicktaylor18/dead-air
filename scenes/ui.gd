extends Control

@onready var attempts_bar: ProgressBar = %ProgressBar
@onready var attempts_label: Label = %AttemptsLabel
	
func _on_console_attempt(attempts, max_attempts) -> void:
	attempts_bar.value = max_attempts
	attempts_bar.value = attempts
	attempts_label.text = str(attempts) + "/" + str(max_attempts)

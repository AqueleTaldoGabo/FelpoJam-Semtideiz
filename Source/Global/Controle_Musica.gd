extends Node

@export var transition_duration: float = 1.0

func fade_out():
	var tween = create_tween()
	
	tween.tween_property(
		$".",
		"volume_db",
		-80.0,
		transition_duration
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)

	tween.finished.connect(_on_fade_finished.bind($"."))


func _on_fade_finished(stream_player: AudioStreamPlayer):
	stream_player.stop()
	stream_player.volume_db = 0

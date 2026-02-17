extends Node

@export var transition_duration: float = 1.0

func fade_out(stream_player: AudioStreamPlayer):
	var tween = create_tween()
	
	tween.tween_property(
		stream_player,
		"volume_db",
		-80.0,
		transition_duration
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)

	tween.finished.connect(_on_fade_finished.bind(stream_player))


func _on_fade_finished(stream_player: AudioStreamPlayer):
	stream_player.stop()
	stream_player.volume_db = 0

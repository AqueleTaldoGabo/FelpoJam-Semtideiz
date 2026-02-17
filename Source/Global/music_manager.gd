extends Node

@export var transition_duration = 1.00
@export var transition_type = 1 # TRANS_SINE

func fade_out(stream_player):
	var tween = create_tween()
	
	tween.tween_property(
		stream_player,
		"volume_db",
		-80.0,
		transition_duration
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)


func _on_TweenOut_tween_completed(object, key):
	# stop the music -- otherwise it continues to run at silent volume
	object.stop()
	object.volume_db = 0

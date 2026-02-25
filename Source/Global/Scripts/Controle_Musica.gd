extends Node
@export var transition_duration: float = 2.0
@onready var player: AudioStreamPlayer = $"."
@onready var original_volume: = player.volume_db
@onready var temp

func fade_out():
	var tween = create_tween()
	tween.tween_property(
		player,
		"volume_db",
		-80.0,
		transition_duration
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	await tween.finished
	player.stop()
	player.volume_db = original_volume

func trocar_musica(nova_stream: AudioStream):
	await fade_out()
	player.stream = nova_stream
	player.play()

func pausa_musica():
	temp = player.get_playback_position()
	player.stop()
	
func play_musica():
	player.play(temp)

	

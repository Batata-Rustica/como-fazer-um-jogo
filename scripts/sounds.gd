extends Node

@export var music_player: AudioStreamPlayer
@export var sound_player: AudioStreamPlayer

var music_files = {}
var sound_files = {}

func load_music(nameSong: String, path: String):
	var music_stream = load(path)
	if music_stream:
		music_files[nameSong] = music_stream

func load_sound(nameSong: String, path: String):
	var sound_stream = load(path)
	if sound_stream:
		sound_files[nameSong] = sound_stream

func play_music(nameSong: String, loop: bool = true):
	if nameSong in music_files:
		music_player.stream = music_files[nameSong]
		music_player.play()
		music_player.loop = loop

func stop_music():
	music_player.stop()

func pause_music():
	music_player.stream_paused = true

func resume_music():
	music_player.stream_paused = false

func set_music_volume(volume: float):
	music_player.volume_db = volume

func play_sound(nameSong: String):
	if nameSong in sound_files:
		sound_player.stream = sound_files[nameSong]
		sound_player.play()

func set_sound_volume(volume: float):
	sound_player.volume_db = volume

func _ready():
	#load_music("footsteps", "res://recursos/sounds/ambiance/zapsplat_foley_footsteps_boots_gumboots_wellingtons_adults_walking_on_concrete_medium_fast_109731.mp3")
	load_sound("background_music1", "res://resources/sounds/music/262836__b_lamerichs__short-loops-01-02-2015-1a.mp3")
	#play_music("background_music1")

extends AudioStreamPlayer

const MUSIC_1 = preload("res://resources/sounds/music/music1.mp3")
const MUSIC_2 = preload("res://resources/sounds/music/music2.mp3")
const MUSIC_3 = preload("res://resources/sounds/music/music3.mp3")
const MUSIC_4 = preload("res://resources/sounds/music/music4.mp3")

func _ready():
	self.stream = MUSIC_1
	self.play(randf_range(0.0, 100.0))

func _process(_delta):
	if (Global.change_music):
		self.stop()
		match Global.music_playing:
			1:
				self.stream = MUSIC_1
			2:
				self.stream = MUSIC_2
			3:
				self.stream = MUSIC_3
			4:
				self.stream = MUSIC_4
		self.play(randf_range(0.0, 100.0))
		Global.change_music = 0

func random_music():
	var music = randi() % 4 + 1
	if (music == 1): return MUSIC_1
	if (music == 2): return MUSIC_2
	if (music == 3): return MUSIC_3
	if (music == 4): return MUSIC_4

func _on_finished():
	self.stream = random_music()
	self.play(randf_range(0.0, 100.0))

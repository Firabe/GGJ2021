extends AudioStreamPlayer

var songs = ["Sounds/Music/track1.wav", "Sounds/Music/track2.wav", "Sounds/Music/track3.wav", "Sounds/Music/track4.wav"]
var pos = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

func _process(delta):
	if(!self.is_playing()):
		pos = pos+1
		if(pos >= songs.size()):
			pos = 0
		self.set_stream(load(songs[pos]))
		self.play()

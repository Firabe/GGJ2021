extends AudioStreamPlayer

var songs = ["Sounds/Music/track1.wav", "Sounds/Music/track2.wav", "Sounds/Music/track3.wav", "Sounds/Music/track4.wav"]
var available = 0
var queue = []
var currentTrack = 0

# Called when the node enters the scene tree for the first time.
func _ready():
#	queueMusic(1)
#	set_process(true)
	pass

func playMemorySound():
	$SoundMemory.play();

func queueMusic(number):
#	queue.push_back("Sounds/Music/track" + str(number) + ".wav")
#	if(number>available):
#		available = number
	pass

func playNext():
	self.set_stream(load(queue.pop_front()))
	self.play()


func _on_Music_finished():
	currentTrack = (currentTrack + 1) % songs.size()
	self.set_stream(load(songs[currentTrack]))
	self.play()

func changeAmbient(name):
	$Ambient.stop()
	$Ambient.set_stream(load("Sounds/Ambient/" + name + ".wav"))
	$Ambient.play()
	
func playOutro():
	self.stop()
	self.set_stream(load("Sounds/Music/Outro.wav"))
	self.play()

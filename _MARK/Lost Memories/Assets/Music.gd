extends AudioStreamPlayer

var songs = ["Sounds/Music/track1.wav", "Sounds/Music/track2.wav", "Sounds/Music/track3.wav", "Sounds/Music/track4.wav"]
var available = 0
var queue = []

# Called when the node enters the scene tree for the first time.
func _ready():
	queueMusic(1)
	set_process(true)

func _process(delta):
	if(!self.is_playing()):
		if(queue.empty()):
			queueMusic(available)
		playNext()
		
func playMemorySound():
	$SoundMemory.play();

func queueMusic(number):
	queue.push_back("Sounds/Music/track" + str(number) + ".wav")
	if(number>available):
		available = number

func playNext():
	self.set_stream(load(queue.pop_front()))
	self.play()

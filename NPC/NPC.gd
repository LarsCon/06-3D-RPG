extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")

var dialogue = [
	"Hello there! (Press E to Continue)",
	"So your the crack shot huh?",
	"Ok then, shoot the 5 targets",
	"Once we're done talking, it's go time! (Press E to start)"
]


func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue", self, "finished")



func _on_Area_body_entered(_body):
	Dialogue.start_dialogue(dialogue)


func _on_Area_body_exited(_body):
	Dialogue.hide_dialogue()


func finished():
	get_node("/root/Game/Target_container").show()
	Global.timer = 60
	Global.update_time()
	get_node("/root/Game/UI/Timer").start()

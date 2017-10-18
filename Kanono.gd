extends Area2D

onready var Radiko = get_node("/root/Radiko")
onready var K = get_node("/root/Radiko/K")
var Kuglo = preload("res://Kuglo.tscn")
onready var Vivo = get_node("Vivo")

var vivo = 10

func _ready():
	set_process(true)

func _process(delta):
	if weakref(K).get_ref():
		look_at(K.get_global_pos())
	else:
		set_process(false)

func _on_Pafi_tempilo_timeout():
	var Kuglo_ = Kuglo.instance()
	Kuglo_.set_global_pos(get_global_pos()+Vector2(cos(get_rot()-PI/2)*100,-sin(get_rot()-PI/2)*100))
	Kuglo_.set_rotd(get_rotd()+180)
	Kuglo_.rapido = Vector2(cos(get_rot()-PI/2)*300,-sin(get_rot()-PI/2)*300)
	Radiko.add_child(Kuglo_)


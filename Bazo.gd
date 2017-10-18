extends Node2D

onready var Radiko = get_node("/root/Radiko")
var Kuglo = preload("res://Kuglo.tscn")
onready var Vivo = get_node("Vivo")

var vivo = 30

func _ready():
	pass

# kamikaze!
func _on_Bazo_area_enter( areo ):
	if T.get_layer_bit(areo, 1):
		areo.queue_free()
		vivo -= 10
		Vivo.set_text(str(vivo))
		if vivo <= 0:
			queue_free()

func _on_Pafi_tempilo_timeout():
	var Kuglo_ = Kuglo.instance()
	Kuglo_.set_global_pos(get_global_pos()+Vector2(40,60))
	Kuglo_.set_rotd(180)
	Kuglo_.rapido = Vector2(0,300)
	Radiko.add_child(Kuglo_)

	var Kuglo_ = Kuglo.instance()
	Kuglo_.set_global_pos(get_global_pos()+Vector2(-40,60))
	Kuglo_.set_rotd(180)
	Kuglo_.rapido = Vector2(0,300)
	Radiko.add_child(Kuglo_)


extends Area2D

onready var Radiko = get_node("/root/Radiko")
var Kuglo = preload("res://Kuglo.tscn")
onready var Vivo = get_node("Vivo")

var vivo = 20

func _ready():
	set_process(true)

func _process(delta):
	if Radiko.kaptitajxo == self:
		set_global_pos(get_global_mouse_pos())

func _on_K_input_event( viewport, evento, shape_idx ):
	if evento.type == InputEvent.SCREEN_TOUCH:
		if evento.pressed:
			Radiko.kaptitajxo = self
		else:
			Radiko.kaptitajxo = null

	elif evento.type == InputEvent.MOUSE_BUTTON:
		if evento.button_index == BUTTON_LEFT:
			if evento.is_pressed():
				Radiko.kaptitajxo = self
			else:
				Radiko.kaptitajxo = null

func _on_Pafi_tempilo_timeout():
	var Kuglo_ = Kuglo.instance()
	Kuglo_.set_global_pos(get_global_pos()+Vector2(10,-80))
	Radiko.add_child(Kuglo_)
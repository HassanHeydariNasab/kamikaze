extends Node2D

var rapido = Vector2(0,-1000)

func _ready():
	set_process(true)

func _process(delta):
	translate(rapido*delta)

func _on_Kuglo_area_enter( areo ):
	if T.get_layer_bit(areo, 10) or T.get_layer_bit(areo, 2) or\
	T.get_layer_bit(areo, 1):
		areo.vivo -= 1
		areo.Vivo.set_text(str(areo.vivo))
		if areo.vivo <= 0:
			areo.queue_free()
	queue_free()

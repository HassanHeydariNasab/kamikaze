extends Node2D

func _ready():
	set_process(true)

func _process(delta):
	translate(Vector2(0, 0.2))

func _on_Monto_area_enter( areo ):
	areo.queue_free()

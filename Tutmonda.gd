extends Node

var agordejo = "user://agordejo.cfg"
onready var Agordejo = ConfigFile.new()

var Menuo = null
var nivelo = 0
var Radiko = null
var Karaktero = null

var lingvo_elektita = false

var akcelometro_aktivita = true
var os = OS.get_name()

var steloj = 10

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		if get_tree().get_current_scene().get_name() == "Menuo":
			get_tree().quit()
		elif get_tree().get_current_scene().get_name() == "Lingvo" and not T.lingvo_elektita:
			pass
			print(1)
		else:
			get_tree().change_scene("res://Menuo.tscn")

func _ready():
	Agordejo.load(agordejo)
	if os == "Android":
		akcelometro_aktivita = Agordejo.get_value("Agordoj", "akcelometro", true)
	else:
		akcelometro_aktivita = Agordejo.get_value("Agordoj", "akcelometro", false)

func get_layer_bit (korpo, bit):
	if korpo extends KinematicBody2D or korpo extends Area2D or\
	korpo extends StaticBody2D:
		return korpo.get_layer_mask_bit(bit)
	elif korpo extends TileMap:
		return korpo.get_collision_layer_bit(bit)
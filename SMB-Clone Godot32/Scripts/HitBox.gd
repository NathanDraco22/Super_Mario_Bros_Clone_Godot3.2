extends StaticBody2D


onready var area_hit = $Area2D
onready var animaciones = $animaciones
onready var punto = load("res://Chapters/Items/Punto_box.tscn")
export var hit_times = 1
func _ready():
	area_hit.connect("body_entered", self,"golpe_por_debajo")
	animaciones.connect("animation_finished",self,"cambio_anim")
	animaciones.play("HitBoxAnim")

func golpe_por_debajo(objeto):
	if objeto.is_in_group("personaje"):
		if hit_times > 0:
			hit_times -=1
			animaciones.play("Golpead")
func cambio_anim(nombre):
	if nombre == "Golpead":
		if hit_times > 0:
			animaciones.play("HitBoxAnim")

func aparacer_moneda():
	var nuevo_punto = punto.instance()
	add_child(nuevo_punto)

extends Node2D

var rng = RandomNumberGenerator.new()
const baseZombie =  preload("res://Instanciable/Zombie.tscn")

export(int) var nbZombie = 7

func _ready():
	for i in range(nbZombie):
		var Zombie = baseZombie.instance()
		Zombie.position = Vector2(200+rng.randi_range(-100, 100),200+rng.randi_range(-100, 100))
		self.add_child(Zombie)


extends Node2D

export(int) var nbZombie = 1
const baseZombie =  preload("res://Instanciable/Zombie.tscn")

func _ready():
	for i in range(nbZombie):
		var Zombie = baseZombie.instance()
		self.add_child(Zombie)



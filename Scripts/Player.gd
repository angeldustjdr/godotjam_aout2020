extends Node2D

export(int) var nbZombie = 7
const baseZombie =  preload("res://Instanciable/Zombie.tscn")
var rng = RandomNumberGenerator.new()
var allZombie = []
export(float) var Rayon = 100

func _ready():
	for i in range(nbZombie):
		var Zombie = baseZombie.instance()
		Zombie.position = Vector2(100+rng.randi_range(-10, 10),100+rng.randi_range(-10, 10))
		allZombie.append(Zombie)
		self.add_child(Zombie)

func _process(delta):
	var barycenter = allZombie[0].position
	var angle = 2*PI/(nbZombie-1)
	for i in range(1,allZombie.size()):
		var destination = Vector2(barycenter.x+Rayon*cos(angle*(i-1)),barycenter.y+Rayon*sin(angle*(i-1)))
		allZombie[i].position += (barycenter - destination)*delta

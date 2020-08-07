extends Sprite

export(float) var minDistance = 50.0
export(float) var maxDistance = 150.0
onready var velocity = 0.0
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	position = Vector2(100+rng.randi_range(-10, 10),100+rng.randi_range(-10, 10))

func _process(delta):
	var allZombie = get_parent().get_children()
	for z in allZombie:
		if z !=self and "Zombie" in z.get_name():
			var deltaPos = Vector2(0.0,0.0)
			var dist = z.position-self.position
			var norm = sqrt( dist.x*dist.x + dist.y*dist.y )
			if norm<minDistance:
				deltaPos += Vector2(minDistance-dist.x,minDistance-dist.y) * delta
			if norm>maxDistance:
				deltaPos += Vector2(dist.x-maxDistance,dist.y-maxDistance) * delta				
			self.position += deltaPos


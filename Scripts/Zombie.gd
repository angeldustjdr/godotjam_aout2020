extends Sprite

var move_speed = 50
var distanceFactor = 0.1

var acceleration = Vector2()
var velocity = Vector2()

var allZombies = []

func _process(delta):
	var repulsionForce = Vector2()
	var attractionForce = Vector2()	
	for zombie in self.get_parent().get_children():
		if "Zombie" in zombie.get_name() and zombie!=self:	
			var distanceNeighbor = self.position.distance_to(zombie.position)*distanceFactor
			repulsionForce+= (self.position - zombie.position)/distanceNeighbor
			attractionForce+= -1*(self.position - zombie.position)*distanceNeighbor

	acceleration += repulsionForce
	acceleration += attractionForce
	velocity += acceleration * delta
	velocity = velocity.clamped(move_speed)
	translate(velocity * delta)
	

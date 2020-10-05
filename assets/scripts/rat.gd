extends Sprite

var degreesUp = 0
var degreesRight = 90
var degreesDown = 180
var degreesLeft = 270

var degreesStart = 0
var degreesCircle = 360

var degreesDivisionSize = 3
var degreesSlightliyForward = 90 / degreesDivisionSize
var degreesAlmostThere = 90 / degreesDivisionSize * (degreesDivisionSize - 1)

var degreesBetweenUpAndRight = degreesUp + degreesAlmostThere
var degreesBetweenRightAndDown = degreesRight + degreesSlightliyForward
var degreesBetweenDownAndLeft = degreesDown + degreesAlmostThere
var degreesBetweenLeftAndUp = degreesLeft + degreesSlightliyForward

var rotationStep = 2
var movementStep = 3

func _ready() :
	rotation_degrees = degreesUp

func _physics_process(delta) :
	normalizedDegrees()

	var betweenLeftAndUp = rotation_degrees >= degreesBetweenLeftAndUp and rotation_degrees < degreesCircle
	var betweenUpAndRight = rotation_degrees >= degreesUp and rotation_degrees < degreesBetweenUpAndRight

	if Input.is_action_pressed("left") :
		rotation_degrees -= rotationStep
	elif Input.is_action_pressed("right") :
		rotation_degrees += rotationStep

	if betweenLeftAndUp or betweenUpAndRight :
		moveRatLookingUp()
	elif rotation_degrees >= degreesBetweenUpAndRight and rotation_degrees < degreesBetweenRightAndDown :
		moveRatLookingRight()
	elif rotation_degrees >= degreesBetweenRightAndDown and rotation_degrees < degreesBetweenDownAndLeft :
		moveRatLookingDown()
	elif rotation_degrees >= degreesBetweenDownAndLeft and rotation_degrees < degreesBetweenLeftAndUp :
		moveRatLookingLeft()

func normalizedDegrees() :
	rotation_degrees = round(rotation_degrees)

	if rotation_degrees < 0 :
		rotation_degrees = degreesCircle + rotation_degrees
	elif rotation_degrees >= degreesCircle :
		rotation_degrees = degreesStart + degreesCircle - rotation_degrees

func moveRatLookingDown() :
	if Input.is_action_pressed("up") :
		position += Vector2(0, movementStep)
	elif Input.is_action_pressed("down") :
		position += Vector2(0, -movementStep)

func moveRatLookingUp() :
	if Input.is_action_pressed("up") :
		position += Vector2(0, -movementStep)
	elif Input.is_action_pressed("down") :
		position += Vector2(0, movementStep)

func moveRatLookingRight() :
	if Input.is_action_pressed("up") :
		position += Vector2(movementStep, 0)
	elif Input.is_action_pressed("down") :
		position += Vector2(-movementStep, 0)

func moveRatLookingLeft() :
	if Input.is_action_pressed("up") :
		position += Vector2(-movementStep, 0)
	elif Input.is_action_pressed("down") :
		position += Vector2(movementStep, 0)

var collisionRange = 40
func withinRange(node) :
	return $head.global_position.distance_to(node.position) < collisionRange

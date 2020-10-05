extends Sprite

var degreesUp = 0
var degreesRight = 90
var degreesDown = 180
var degreesLeft = 270

var degreesStart = 0
var degreesCircle = 360

var degreesHalfwayBetween = 90 / 2

var degreesBetweenUpAndRight = degreesUp + degreesHalfwayBetween
var degreesBetweenRightAndDown = degreesRight + degreesHalfwayBetween
var degreesBetweenDownAndLeft = degreesDown + degreesHalfwayBetween
var degreesBetweenLeftAndUp = degreesLeft + degreesHalfwayBetween

var rotationStep = 5
var movementStep = 5

func _ready() :
	rotation_degrees = degreesUp

func _input(event) :
	normalizedDegrees()

	if (rotation_degrees >= degreesBetweenLeftAndUp and rotation_degrees < degreesCircle) or (rotation_degrees >= degreesUp and rotation_degrees < degreesBetweenUpAndRight) :
		moveRatLookingUp(event)
	elif rotation_degrees >= degreesBetweenUpAndRight and rotation_degrees < degreesBetweenRightAndDown :
		moveRatLookingRight(event)
	elif rotation_degrees >= degreesBetweenRightAndDown and rotation_degrees < degreesBetweenDownAndLeft :
		moveRatLookingDown(event)
	elif rotation_degrees >= degreesBetweenDownAndLeft and rotation_degrees < degreesBetweenLeftAndUp :
		moveRatLookingLeft(event)

func normalizedDegrees() :
	if rotation_degrees < 0 :
		rotation_degrees = degreesCircle + rotation_degrees
	elif rotation_degrees >= degreesCircle :
		rotation_degrees = degreesStart + degreesCircle - rotation_degrees

func moveRatLookingDown(event) :
	if event.is_action_pressed("right") :
		rotation_degrees -= rotationStep
	elif event.is_action_pressed("left") :
		rotation_degrees += rotationStep

	if event.is_action_pressed("down") :
		position += Vector2(0, movementStep)

func moveRatLookingUp(event) :
	if event.is_action_pressed("right") :
		rotation_degrees += rotationStep
	elif event.is_action_pressed("left") :
		rotation_degrees -= rotationStep

	if event.is_action_pressed("up") :
		position += Vector2(0, -movementStep)

func moveRatLookingRight(event) :
	if event.is_action_pressed("down") :
		rotation_degrees += rotationStep
	elif event.is_action_pressed("up") :
		rotation_degrees -= rotationStep

	if event.is_action_pressed("right") :
		position += Vector2(movementStep, 0)

func moveRatLookingLeft(event) :
	if event.is_action_pressed("up") :
		rotation_degrees += rotationStep
	elif event.is_action_pressed("down") :
		rotation_degrees -= rotationStep

	if event.is_action_pressed("left") :
		position += Vector2(-movementStep, 0)

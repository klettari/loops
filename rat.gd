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

var rotationStep = 1
var movementStep = 3

func _ready() :
	rotation_degrees = degreesUp

func _physics_process(delta) :
	normalizedDegrees()

	var betweenLeftAndUp = rotation_degrees >= degreesBetweenLeftAndUp and rotation_degrees < degreesCircle
	var betweenUpAndRight = rotation_degrees >= degreesUp and rotation_degrees < degreesBetweenUpAndRight

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
	if Input.is_action_pressed("right") :
		rotation_degrees -= rotationStep
	elif Input.is_action_pressed("left") :
		rotation_degrees += rotationStep

	if Input.is_action_pressed("down") :
		position += Vector2(0, movementStep)

func moveRatLookingUp() :
	if Input.is_action_pressed("right") :
		print("moving rat looking up - right is pressed")
		print(rotation_degrees)
		rotation_degrees += rotationStep
		print(rotation_degrees)
	elif Input.is_action_pressed("left") :
		rotation_degrees -= rotationStep

	if Input.is_action_pressed("up") :
		position += Vector2(0, -movementStep)

func moveRatLookingRight() :
	if Input.is_action_pressed("down") :
		rotation_degrees += rotationStep
	elif Input.is_action_pressed("up") :
		rotation_degrees -= rotationStep

	if Input.is_action_pressed("right") :
		position += Vector2(movementStep, 0)

func moveRatLookingLeft() :
	if Input.is_action_pressed("up") :
		rotation_degrees += rotationStep
	elif Input.is_action_pressed("down") :
		rotation_degrees -= rotationStep

	if Input.is_action_pressed("left") :
		position += Vector2(-movementStep, 0)

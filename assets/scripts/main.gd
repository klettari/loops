extends Node

var random

var spriteWidth = 124
var spriteHeight = 124

var screenWidth = 1024
var screenHeight = 600

var vericalOffset = 20
var horizontalOffset = 100

var lowestXValue = spriteWidth / 2 + horizontalOffset
var lowestYValue = spriteHeight / 2 + vericalOffset
var highestXValue = screenWidth - 124 / 2 - horizontalOffset
var highestYValue = screenHeight - 124 / 2 - vericalOffset

var totalLoopsOfEachKind = 100

func _ready():
	random = RandomNumberGenerator.new()
	random.randomize()

	var packagedSceneOrange = load("res://assets/scenes/orange.tscn")
	var packagedSceneRed = load("res://assets/scenes/red.tscn")
	
	for i in range(0, totalLoopsOfEachKind) :
		placeLoop(packagedSceneOrange)
		placeLoop(packagedSceneRed)

func placeLoop(packagedScene) :
	var x = random.randi_range(lowestXValue, highestXValue)
	var y = random.randi_range(lowestYValue, highestYValue)
		
	var loopInstance = packagedScene.instance()
	loopInstance.set_position(Vector2(x, y))
	add_child(loopInstance)

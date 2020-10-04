extends Node

var random

var spriteWidth = 124
var spriteHeight = 124

var screenWidth = 1024
var screenHeight = 600

var vericalOffset = 100
var horizontalOffset = 150

var lowestXValue = spriteWidth / 2 + horizontalOffset
var lowestYValue = spriteHeight / 2 + vericalOffset
var highestXValue = screenWidth - 124 / 2 - horizontalOffset
var highestYValue = screenHeight - 124 / 2 - vericalOffset

var totalLoopsOfEachKind = 20

func _ready():
	random = RandomNumberGenerator.new()
	random.randomize()

	var packagedSceneOrange = load("res://assets/scenes/orange.tscn")
	var packagedSceneRed = load("res://assets/scenes/red.tscn")
	var packagedSceneYellow = load("res://assets/scenes/yellow.tscn")
	var packagedSceneGreen = load("res://assets/scenes/green.tscn")
	var packagedSceneCyan = load("res://assets/scenes/cyan.tscn")
	var packagedScenePurple = load("res://assets/scenes/purple.tscn")
	
	for i in range(0, totalLoopsOfEachKind) :
		placeLoop(packagedSceneOrange)
		placeLoop(packagedSceneRed)
		placeLoop(packagedSceneYellow)
		placeLoop(packagedSceneGreen)
		placeLoop(packagedSceneCyan)
		placeLoop(packagedScenePurple)

func placeLoop(packagedScene) :
	var x = random.randi_range(lowestXValue, highestXValue)
	var y = random.randi_range(lowestYValue, highestYValue)
		
	var loopInstance = packagedScene.instance()
	loopInstance.set_position(Vector2(x, y))
	add_child(loopInstance)

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

var orangeTexture = preload("res://assets/img/orange.png")
var brokenOrangeTexture = preload("res://assets/img/orange-broken.png")
var redTexture = preload("res://assets/img/red.png")
var brokenRedTexture = preload("res://assets/img/red-broken.png")
var yellowTexture = preload("res://assets/img/yellow.png")
var brokenYellowTexture = preload("res://assets/img/yellow-broken.png")
var greenTexture = preload("res://assets/img/green.png")
var brokenGreenTexture = preload("res://assets/img/green-broken.png")
var cyanTexture = preload("res://assets/img/cyan.png")
var brokenCyanTexture = preload("res://assets/img/cyan-broken.png")
var purpleTexture = preload("res://assets/img/purple.png")
var brokenPurpleTexture = preload("res://assets/img/purple-broken.png")

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

func _physics_process(delta) :
	var loops = get_tree().get_nodes_in_group("loops")
	for loopIndex in range(loops.size() - 1, -1, -1) :
		var loop = loops[loopIndex]
		if $rat.withinRange(loop) :
			var texture = loop.get_texture()
			if texture == brokenOrangeTexture or texture == brokenRedTexture or texture == brokenYellowTexture or texture == brokenGreenTexture or texture == brokenCyanTexture or texture == brokenPurpleTexture :
				remove_child(loop)

			if texture == orangeTexture :
				loop.set_texture(brokenOrangeTexture)
			elif texture == redTexture :
				loop.set_texture(brokenRedTexture)
			elif texture == yellowTexture :
				loop.set_texture(brokenYellowTexture)
			elif texture == greenTexture :
				loop.set_texture(brokenGreenTexture)
			elif texture == cyanTexture :
				loop.set_texture(brokenCyanTexture)
			elif texture == purpleTexture :
				loop.set_texture(brokenPurpleTexture)

			break

func placeLoop(packagedScene) :
	var x = random.randi_range(lowestXValue, highestXValue)
	var y = random.randi_range(lowestYValue, highestYValue)
		
	var loopInstance = packagedScene.instance()
	loopInstance.set_position(Vector2(x, y))
	loopInstance.add_to_group("loops")
	add_child(loopInstance)

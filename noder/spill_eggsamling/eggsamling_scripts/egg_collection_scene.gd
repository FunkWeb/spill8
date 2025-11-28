extends Node2D


var health: int = 3
var score: int
var timer: float

func _process(_delta:float) -> void:
	$TimerText.text = str(int($Timer.time_left)+1)

func healthLoss():
	health -= 1

	match health:
		2: $Liv3.animation = "hurt"
		1: $Liv2.animation = "hurt"
		0: $Liv1.animation = "hurt"
		
	if (health <= 0):
		print("DEAD")
		gameEnd(false)

func _on_timer_timeout():
	gameEnd(true)

func gameEnd(win:bool):
	score = $EggSpawner.score
	timer = $Timer.time_left
	$Kurv.queue_free()
	$EggSpawner.queue_free()
	$Egg.queue_free()
	$Timer.stop()
	
	
	if (win):
		$"Pauseskjerm/Overskrift".text = "Du vant!"
		$"Pauseskjerm/Tekst".text = "Gratulerer! Du samlet totalt " + str(score) + " egg, og klarte deg til tiden gikk ut!"
	else:
		$"Pauseskjerm/Overskrift".text = "Du tapte.."
		$"Pauseskjerm/Tekst".text = "Dessverre klarte du bare å samle " + str(score) + " egg før du tapte, med " + str(int(timer)+1) + " sekunder igjen."
		
	$Pauseskjerm.visible = true

func menyKnapp():
	get_tree().change_scene_to_file("res://scener/hovedmeny.tscn")
	
func restartKnapp():
	get_tree().change_scene_to_file("res://scener/egg_collection_scene.tscn")
	
func gardsKnapp():
	get_tree().change_scene_to_file("res://scener/bondegaard.tscn")

extends Node

class_name DailyChallenge

export(String, FILE) var input_path

func get_input_data() -> Array:
	var file: = File.new()
	file.open(input_path, File.READ)
	var content = file.get_as_text()
	var input = []
	for item in content.split('\n'):
		input.append(item)

	file.close()

	return input

func _ready():
	$HSplitContainer/Part1.connect("pressed", self, "_on_Part1_pressed")
	$HSplitContainer/Part2.connect("pressed", self, "_on_Part2_pressed")


func _on_Part1_pressed():
	print('_on_Part1_pressed not implemented')


func _on_Part2_pressed():
	print('_on_Part2_pressed not implemented')

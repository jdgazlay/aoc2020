extends VBoxContainer

var input_data: = []

func _ready():
	var file: = File.new()
	file.open("res://Resources/day01_input.tres", File.READ)
	var content = file.get_as_text()
	for num in content.split('\n'):
		input_data.append(int(num))
	file.close()
	
	$HSplitContainer/Part1.connect("pressed", self, "_on_Part1_pressed")
	$HSplitContainer/Part2.connect("pressed", self, "_on_Part2_pressed")


func _on_Part1_pressed():
	for num_index in range(len(input_data)):
		for next_index in range(len(input_data) - num_index - 1):
			if input_data[num_index] + input_data[next_index + num_index + 1] == 2020:
				print(input_data[num_index] * input_data[next_index + num_index + 1])


func _on_Part2_pressed():
	for num_index in range(len(input_data)):
		for next_index in range(len(input_data) - num_index - 1):
			for last_index in range(len(input_data) - num_index - next_index - 2):
				if input_data[num_index] + input_data[next_index + num_index + 1] + input_data[num_index + next_index + last_index + 2] == 2020:
					print(input_data[num_index] * input_data[next_index + num_index + 1] * input_data[num_index + next_index + last_index + 2])

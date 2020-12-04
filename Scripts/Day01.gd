extends DailyChallenge


func _on_Part1_pressed():
	var input_data: = get_input_data()

	for num_index in range(len(input_data)):
		for next_index in range(len(input_data) - num_index - 1):
			if int(input_data[num_index]) + int(input_data[next_index + num_index + 1]) == 2020:
				print(int(input_data[num_index]) * int(input_data[next_index + num_index + 1]))


func _on_Part2_pressed():
	var input_data: = get_input_data()

	for num_index in range(len(input_data)):
		for next_index in range(len(input_data) - num_index - 1):
			for last_index in range(len(input_data) - num_index - next_index - 2):
				if int(input_data[num_index]) + int(input_data[next_index + num_index + 1]) + int(input_data[num_index + next_index + last_index + 2]) == 2020:
					print(int(input_data[num_index]) * int(input_data[next_index + num_index + 1]) * int(input_data[num_index + next_index + last_index + 2]))

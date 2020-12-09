extends DailyChallenge


func run_boot_code(instructions):
	var acc = 0
	var visited_indices = []
	var index = 0
	var boot_complete = false

	while not index in visited_indices and !boot_complete:
		visited_indices.append(index)

		var codes = instructions[index].split(' ')

		if codes[0] == 'nop':
			index += 1
		elif codes[0] == 'acc':
			acc += int(codes[1])
			index += 1
		elif codes[0] == 'jmp':
			index += int(codes[1])

		if index > len(instructions) - 1:
			boot_complete = true

	return [acc, boot_complete]


func _on_Part1_pressed():
	var instructions = get_input_data()

	var boot_status = run_boot_code(instructions)

	print(boot_status[0])


func _on_Part2_pressed():
	var instructions = get_input_data()
	var instructions_copy = []

	for index in range(len(instructions) - 1):
		var codes = instructions[index].split(' ')

		if codes[0] == 'nop':
			instructions_copy = instructions.duplicate()
			instructions_copy[index] = 'jmp ' + codes[1]
			var boot = run_boot_code(instructions_copy)

			if boot[1]:
				print(boot[0])
				break
		elif codes[0] == 'jmp':
			instructions_copy = instructions.duplicate()
			instructions_copy[index] = 'nop ' + codes[1]
			var boot = run_boot_code(instructions_copy)

			if boot[1]:
				print(boot[0])
				break



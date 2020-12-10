extends DailyChallenge


func find_addends(sequence, sum):
	var addend1 = 0
	var addend2
	while addend1 in range(len(sequence)):
		addend2 = addend1 + 1
		while addend2 in range(len(sequence)):
			if sequence[addend1] + sequence[addend2] == sum:
				return true
			addend2 += 1
		addend1 += 1
	return false


func get_input_data():
	var raw_data = get_raw_input()

	var input = []
	for item in raw_data.split('\n'):
		if item.strip_edges():
			input.append(int(item))

	return input


func _on_Part1_pressed():
	var data_sequence = get_input_data()
	var lookback = 25
	var index = lookback
	var addends_found = true

	while index < len(data_sequence) and addends_found:
		addends_found = find_addends(
			data_sequence.slice(index - lookback, index - 1),
			data_sequence[index]
		)
		if addends_found:
			index += 1

	print(data_sequence[index])
	return data_sequence[index]


func sum(addends):
	var sum = 0
	for num in addends:
		sum += num
	return sum


func _on_Part2_pressed():
	var data_sequence = get_input_data()
	var sum_check = _on_Part1_pressed()
	var addends = []
	var index = 0

	while index in range(len(data_sequence)):
		var addend_sum = sum(addends)

		if addend_sum < sum_check:
			addends.push_back(data_sequence[index])
			index += 1
		elif addend_sum > sum_check:
			addends.pop_front()
		elif addend_sum == sum_check:
			break

	addends.sort()
	print(addends[0] + addends[len(addends) - 1])





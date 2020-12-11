extends DailyChallenge

func get_input_data():
	var raw_data = get_raw_input()

	var input = []
	for item in raw_data.split('\n'):
		if item.strip_edges():
			input.append(int(item))

	return input

func _on_Part1_pressed():
	var adapters = get_input_data()
	var diffs = {
		1: 0,
		3: 0,
	}
	adapters.sort()
	adapters.push_front(0)
	adapters.push_back(adapters[len(adapters) - 1] + 3)

	for index in range(len(adapters) - 1):
		diffs[adapters[index + 1] - adapters[index]] += 1

	print(diffs[1] * diffs[3])


func _on_Part2_pressed():
	var adapters = get_input_data()

	var pattern_one_regex = RegEx.new()
	var pattern_two_regex = RegEx.new()
	var pattern_three_regex = RegEx.new()
	pattern_one_regex.compile('(^|[^1])[1]{2}(?=3)')
	pattern_two_regex.compile('(^|[^1])[1]{3}(?=3)')
	pattern_three_regex.compile('(^|[^1])[1]{4}(?=3)')
	var p1_count = 0
	var p2_count = 0
	var p3_count = 0

	var diffs = ""
	adapters.sort()
	adapters.push_front(0)
	adapters.push_back(adapters[len(adapters) - 1] + 3)

	for index in range(len(adapters) - 1):
		diffs += str(adapters[index + 1] - adapters[index])
	print(diffs)

	for result in pattern_one_regex.search_all(diffs):
		p1_count += 1

	for result in pattern_two_regex.search_all(diffs):
		p2_count += 1

	for result in pattern_three_regex.search_all(diffs):
		p3_count += 1

	print(pow(2, p1_count) * pow(4, p2_count) * pow(7, p3_count))

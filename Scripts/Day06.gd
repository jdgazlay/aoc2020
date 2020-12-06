extends DailyChallenge

func get_input_data():
	var raw_input = get_raw_input()
	return raw_input.split('\n\n')


func _on_Part1_pressed():
	var group_forms = get_input_data()
	var sum_of_same = 0

	for group_form in group_forms:
		var forms = group_form.strip_edges().split('\n')
		var group_answers = []

		for form in forms:
			for answer in form:
				if not answer in group_answers:
					group_answers.append(answer)
		sum_of_same += len(group_answers)

	print(sum_of_same)


func _on_Part2_pressed():
	var group_forms = get_input_data()
	var sum_of_different = 0

	for group_form in group_forms:
		var forms = group_form.strip_edges().split('\n')
		var group_answers = []

		if len(forms) == 1:
			sum_of_different += len(forms[0])
			continue

		for answer in forms[0]:
			var in_every_declaration = true
			var idx = 1

			while idx < len(forms):
				if not answer in forms[idx]:
					in_every_declaration = false
				idx += 1

			if in_every_declaration:
				group_answers.append(answer)

		sum_of_different += len(group_answers)

	print(sum_of_different)


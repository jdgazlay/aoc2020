extends DailyChallenge


func get_input_data() -> Array:
	var input_data: = .get_input_data()

	var input_return: = []

	for password in input_data:
		var password_data = password.split(":")
		if len(password_data) >= 2:
			input_return.append({"policy": password_data[0], "password": password_data[1].strip_edges()})

	return input_return


func _on_Part1_pressed():
	var input_data: = get_input_data()

	var valid_count = 0

	for password in input_data:
		var policy_count = password.policy.split('-')
		var policy_letter = password.policy[-1]
		var policy_min = int(policy_count[0]) - 1
		var policy_max = int(policy_count[1]) - 1

		var count = password.password.count(policy_letter)
		if count >= policy_min and count <= policy_max:
			valid_count += 1

	print(valid_count)


func _on_Part2_pressed():
	var input_data: = get_input_data()

	var valid_count = 0

	for password in input_data:
		var policy_count = password.policy.split('-')
		var policy_letter = password.policy[-1]
		var policy_position_one = int(policy_count[0]) - 1
		var policy_position_two = int(policy_count[1]) - 1

		var match_one = password.password[policy_position_one] == policy_letter
		var match_two = password.password[policy_position_two] == policy_letter

		if (match_one and !match_two) or (!match_one and match_two):
			valid_count += 1


	print(valid_count)

extends VBoxContainer

var input_data = []

func _ready():
	var file: = File.new()
	file.open("res://Resources/day02_input.tres", File.READ)
	var content = file.get_as_text()
	# content = "4-7 k: kfkgkkkkk"
	for password in content.split('\n'):
		var password_data = password.split(":")
		if len(password_data) >= 2:
			input_data.append({"policy": password_data[0], "password": password_data[1].strip_edges()})
	file.close()

	$HSplitContainer/Part1.connect("pressed", self, "_on_Part1_pressed")
	$HSplitContainer/Part2.connect("pressed", self, "_on_Part2_pressed")


func _on_Part1_pressed():
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

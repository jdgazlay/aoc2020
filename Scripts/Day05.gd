extends DailyChallenge



func find_seat(directions, lower_bound, upper_bound):
	var lower = lower_bound
	var upper = upper_bound

	for dir in directions:
		if dir == 'F' or dir == 'L':
			upper -= (upper - lower + 1) / 2
		elif dir == 'B' or dir == 'R':
			lower += (upper - lower + 1) / 2

	return lower - 1


func _on_Part1_pressed():
	var boarding_passes = get_input_data()

	var highest_seat_id = 0

	for boarding_pass in boarding_passes:
		var row = find_seat(boarding_pass.left(7), 1, 128)
		var col = find_seat(boarding_pass.right(7), 1, 8)
		var seat_id = row * 8 + col

		highest_seat_id = seat_id if seat_id > highest_seat_id else highest_seat_id

	print(highest_seat_id)


func _on_Part2_pressed():
	var boarding_passes = get_input_data()
	var seat_ids = []

	for boarding_pass in boarding_passes:
		var row = find_seat(boarding_pass.left(7), 1, 128)
		var col = find_seat(boarding_pass.right(7), 1, 8)
		seat_ids.append(row * 8 + col)

	seat_ids.sort()

	var my_seat

	for index in range(len(seat_ids) - 1):
		if seat_ids[index + 1] - seat_ids[index] == 2:
			print('caught')
			my_seat = seat_ids[index] + 1
	print(my_seat)

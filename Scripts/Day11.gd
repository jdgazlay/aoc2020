extends DailyChallenge

const occupied = '#'
const empty = 'L'
const the_floor = '.'


func count_occupied_neighbors(row, col, rows):
	var occupied_count = 0

	occupied_count += int(row - 1 >= 0 and col - 1 >= 0 and rows[row - 1][col - 1] == occupied)
	occupied_count += int(row - 1 >= 0 and rows[row - 1][col] == occupied)
	occupied_count += int(row - 1 >= 0 and col + 1 < len(rows[row - 1]) and rows[row - 1][col + 1] == occupied)

	occupied_count += int(col - 1 >= 0 and rows[row][col - 1] == occupied)
	occupied_count += int(col + 1 < len(rows[row]) and rows[row][col + 1] == occupied)

	occupied_count += int(row + 1 < len(rows) and col - 1 >= 0 and rows[row + 1][col - 1] == occupied)
	occupied_count += int(row + 1 < len(rows) and rows[row + 1][col] == occupied)
	occupied_count += int(row + 1 < len(rows) and col + 1 < len(rows[row + 1]) and rows[row + 1][col + 1] == occupied)

	return occupied_count


func fill_seats(rows):
	var new_seats = rows.duplicate()
	var updates = 0

	for row_index in range(len(rows)):
		for seat_index in range(len(rows[0])):
			if rows[row_index][seat_index] == the_floor:
				continue
			elif rows[row_index][seat_index] == empty:
				if count_occupied_neighbors(row_index, seat_index, rows) <= 0:
					new_seats[row_index][seat_index] = '#'
					updates += 1
			elif rows[row_index][seat_index] == occupied:
				if count_occupied_neighbors(row_index, seat_index, rows) >= 4:
					new_seats[row_index][seat_index] = 'L'
					updates += 1

	return [new_seats, updates]


func _on_Part1_pressed():
	var rows = get_input_data()

	var occupied_seat_count = 0
	var filling_seats = true

	while filling_seats:
		var fill_seats_run = fill_seats(rows)
		filling_seats = fill_seats_run[1] > 0

		rows = fill_seats_run[0]

	for row in rows:
		for seat in row:
			occupied_seat_count += int(seat == occupied)

	print(occupied_seat_count)


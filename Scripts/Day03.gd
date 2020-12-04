extends DailyChallenge

const TREE = '#'


func check_slope(col_move: int, row_move: int) -> int:
	var input_data = get_input_data()
	var curr_row = 0
	var curr_col = 0
	var tree_count = 0

	while curr_row < len(input_data) - 1:
		curr_row += row_move
		curr_col += col_move

		if curr_row >= len(input_data) - 1:
			continue

		if curr_col > input_data[curr_row].length() - 1:
			curr_col -= input_data[curr_row].length()

		if input_data[curr_row][curr_col] == TREE:
			tree_count += 1

	return tree_count


func _on_Part1_pressed():
	print(check_slope(3, 1))


func _on_Part2_pressed():
	var move_set = [
		[1, 1],
		[3, 1],
		[5, 1],
		[7, 1],
		[1, 2]
	]

	var path_tree_product: = 1

	for move in move_set:
		path_tree_product *= check_slope(move[0], move[1])

	print(path_tree_product)


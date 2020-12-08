extends DailyChallenge


func _on_Part1_pressed():
	var luggages = get_input_data()
	var parent_bag_pattern = '^(\\w+ \\w+) .+ \\d+ {{bag}} bag'
	var current_bag_pattern = '({{bag}}) bags contain'
	var matched_bags = ['shiny gold']

	var total_bag_matches = 0

	for bag in matched_bags:
		var parent_bag = RegEx.new()
		parent_bag.compile(parent_bag_pattern.replace('{{bag}}', bag))

		var current_bag = RegEx.new()
		current_bag.compile(current_bag_pattern.replace('{{bag}}', bag))

		for luggage in luggages:
			var parent_bag_results = parent_bag.search(luggage)
			var current_bag_results = current_bag.search(luggage)

			if current_bag_results and bag != matched_bags[0]:
				total_bag_matches += 1

			if parent_bag_results:
				if not parent_bag_results.get_string(1) in matched_bags:
					matched_bags.append(parent_bag_results.get_string(1))

	print(total_bag_matches)



func search_bags(search_bag, luggages):
	var bag_pattern = '{{bag}} bags contain'

	var next_bag_pattern = '^(\\d+) (\\w+ \\w+) bags?\\.?'

	var total = 0

	for luggage in luggages:
		var current_bag = RegEx.new()
		current_bag.compile(bag_pattern.replace('{{bag}}', search_bag))
		var found = current_bag.search(luggage)

		if found:
			var bags = luggage.split('contain')[1].split(',')

			for bag in bags:
				if bag.strip_edges() == 'no other bags.':
					return 1
				else:
					var next_bag = RegEx.new()
					next_bag.compile(next_bag_pattern)
					var found_next_bag = next_bag.search(bag.strip_edges())
					var children_total = search_bags(found_next_bag.get_string(2), luggages)

					if children_total != 1:
						total += int(found_next_bag.get_string(1))

					total += int(found_next_bag.get_string(1)) * children_total

	return total


func _on_Part2_pressed():
	var luggages = get_input_data()

	var total_bags = search_bags('shiny gold', luggages)
	print(total_bags)

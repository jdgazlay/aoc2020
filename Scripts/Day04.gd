extends DailyChallenge

const papers_please = ['byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid']
const arstotzka_special = [
	'\\bbyr:(19[2-9][0-9]|200[0-2])\\b',
	'\\biyr:(201[0-9]|2020)\\b',
	'\\beyr:(202[0-9]|2030)\\b',
	'\\bhgt:(1[5-8][0-9]cm|19[0-3]cm|59in|6[0-9]in|7[0-6]in)\\b',
	'\\bhcl:(#[a-f0-9]{6})\\b',
	'\\becl:(amb|blu|brn|gry|grn|hzl|oth)\\b',
	'\\bpid:([0-9]{9})\\b',
]

func get_input_data():
	return get_raw_input().split('\n\n')


func count_valid_passports(passport_requirements):
	var passports = get_input_data()

	var valid_count = 0

	for passport in passports:
		var valid = true
		for requirement in passport_requirements:
			var regex = RegEx.new()
			regex.compile(requirement)

			if not regex.search(passport):
				valid = false
				break
		if valid:
			valid_count += 1

	return valid_count


func _on_Part1_pressed():
	print(count_valid_passports(papers_please))

func _on_Part2_pressed():
	print(count_valid_passports(arstotzka_special))

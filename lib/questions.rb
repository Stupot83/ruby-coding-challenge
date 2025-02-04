# round up a float up and convert it to an Integer,
# so 3.214 becomes 4
def round_up_number(float)
	float.ceil
end

# round down a float up and convert it to an Integer,
# so 9.52 becomes 9
def round_down_number(float)
	float.floor
end


# turn a positive integer into a negative integer. A negative integer
# stays negative
def make_numbers_negative(number)
	number > 0 ? number * -1 : number
end

# swap the keys and values in a hash. e.g.
# {'a' => 'b', 'c' => 'd'} becomes
# {'b' => 'a', 'd' => 'c'}
def swap_keys_and_values_in_a_hash(hash)
	hash.invert
end

# in a hash where the keys and values are all numbers
# add all the keys and all the values together, e.g.
# {1 => 1, 2 => 2} becomes 6
def add_together_keys_and_values(hash)
	hash.reduce(0) {|add, (key, value)| add + (key + value)}
end

# turn an array (with an even number of elements) into a hash, by
# pairing up elements. e.g. ['a', 'b', 'c', 'd'] becomes
# {'a' => 'b', 'c' => 'd'}
def convert_array_to_a_hash(array)
	Hash[*array.flatten(1)]
end


# take out all the capital letters from a string
# so 'Hello JohnDoe' becomes 'ello ohnoe'
def remove_capital_letters_from_string(string)
	 string.gsub(/[A-Z]/, '')
end


# cut strings in half, and return the first half, e.g.
# 'banana' becomes 'ban'. If the string is an odd number of letters
# round up - so 'apple' becomes 'app'
def get_first_half_of_string(string)
	first_half = (string.length / 2.0).ceil
  	string[0, first_half]
end

# convert a symbol into a string
def turn_symbol_into_string(symbol)
	symbol.to_s
end


# get the domain name *without* the .com part, from an email address
# so onboarding@makersacademy.com becomes makersacademy
def get_domain_name_from_email_address(email)
	email.gsub(/.+@([^.]+).+/, '\1')
end

# capitalize the first letter in each word of a string,
#  except 'a', 'and' and 'the'
# *unless* they come at the start of the start of the string, e.g.
# 'the lion the witch and the wardrobe' becomes
# 'The Lion the Witch and the Wardrobe'
def titleize_a_string(string)
	string.split.inject([]) do |words, word|
	words << (%w(a and the).include?(word) && words.any? ? word : word.capitalize)
	end.join(' ')
end

# return true if a string contains any special characters
# where 'special character' means anything apart from the letters
# a-z (uppercase and lower) or numbers
def check_a_string_for_special_characters(string)
	/\W/ === string
end

# keep only the elements that start with an a
def select_elements_starting_with_a(array)
	array.select { |word| word.start_with? 'a' }
end

# keep only the elements that start with a vowel
def select_elements_starting_with_vowel(array)
	array.select { |word| word =~ /\A[aeiou]/i }
end


# remove instances of nil (but NOT false) from an array
def remove_nils_from_array(array)
	array.compact
end

# remove instances of nil AND false from an array
def remove_nils_and_false_from_array(array)
	array.reject(&:!)
end

# don't reverse the array, but reverse every word inside it. e.g.
# ['dog', 'monkey'] becomes ['god', 'yeknom']
def reverse_every_element_in_array(array)
	array.map(&:reverse)
end

# discard the first 3 elements of an array,
# e.g. [1, 2, 3, 4, 5, 6] becomes [4, 5, 6]
def all_elements_except_first_3(array)
	array.drop(3)
end

# add an element to the beginning of an array
def add_element_to_beginning_of_array(array, element)
	array.unshift(element)
end

# return the shortest word in an array
def shortest_word_in_array(array)
	array.min_by(&:length)
end

# return the longest word in an array
def longest_word_in_array(array)
	array.max_by(&:length)
end

# add up all the numbers in an array, so [1, 3, 5, 6]
# returns 15
def total_of_array(array)
	array.sum
end

# get the average from an array, rounded to the nearest integer
# so [10, 15, 25] should return 17
def average_of_array(array)
	(array.inject(:+).to_f / array.size).round
end

# get all the elements in an array, up until the first element
# which is greater than five. e.g.
# [1, 3, 5, 4, 1, 2, 6, 2, 1, 3, 7]
# becomes [1, 3, 5, 4, 1, 2]
def get_elements_until_greater_than_five(array)
	array.take_while { |comp| comp <= 5 }
end

# get all the letters used in an array of words and return
# it as a array of letters, in alphabetical order
# . e.g. the array ['cat', 'dog', 'fish'] becomes
# ['a', 'c', 'd', 'f', 'g', 'h', 'i', 'o', 's', 't']
def get_all_letters_in_array_of_words(array)
	array.join.chars.sort	
end

# BONUS SECTION

# take a date and format it like dd/mm/yyyy, so Halloween 2013
# becomes 31/10/2013
def format_date_nicely(date)
	date.strftime("%d/%m/%Y")
end

# get the upper limit of a range. e.g. for the range 1..20, you
# should return 20
def get_upper_limit_of(range)
	range.max
end

# should return true for a 3 dot range like 1...20, false for a
# normal 2 dot range
def is_a_3_dot_range?(range)
	range.exclude_end?
end

# get the square root of a number
def square_root_of(number)
	Math.sqrt(number)
end

# --- tougher ones ---

# call an arbitrary method from a string. so if I
# called call_method_from_string('foobar')
# the method foobar should be invoked
def call_method_from_string(str_method)
	send(str_method)
end

# return true if the date is a uk bank holiday for 2018
# the list of bank holidays is here:
# https://www.gov.uk/bank-holidays
def is_a_2018_bank_holiday?(date)
	date = date.strftime '%-Y/%-m/%-d'
  	bank_holidays = ['2018/1/1', '2018/3/30', '2018/4/2', '2018/5/7', '2018/5/28', '2018/8/27', '2018/12/25', '2018/12/26']
  	bank_holidays.include?(date)
end

# given your birthday this year, this method tells you
# the next year when your birthday will fall on a friday
# e.g. january 1st, will next be a friday in 2016
# return the day as a capitalized string like 'Friday'
def your_birthday_is_on_a_friday_in_the_year(birthday)
	until birthday.friday?
    birthday = Time.new birthday.year + 1, birthday.month, birthday.day
  end
  birthday.year
end

# count the number of words in a file
def word_count_a_file(file_path)
	IO.read(file_path).split.length
end


# in a file, total the number of times words of different lengths
# appear. So in a file with the text "the cat sat on the blue mat"
# I have 5 words which are 3 letters long, 1 which is 2 letters long
# and 1 that is 4 letters long. Return it as a hash in the format
# word_length => count, e.g. {2 => 1, 3 => 5, 4 => 1}
def count_words_of_each_length_in_a_file(file_path)
	hash = {}
	File.open(file_path,"r") do |f|
    	f.each_line do |line|
			line.scan(/[\w\']+/).each do |word|
			hash.key?(word.length) ? hash[word.length] += 1 : hash[word.length] = 1
			end
   		end
  	end
  	hash
end

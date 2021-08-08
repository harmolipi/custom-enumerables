require './enumerable'

numbers = [1, 2, 3, 4, 5]
hash = { A: 1, B: 2, C: 3, D: 4, E: 5 }

puts 'my_each vs. each'
numbers.my_each { |item| puts item }
puts "\n"
numbers.each { |item| puts item }
puts "-----\n"

puts 'my_each_with_index vs. each_with_index'
numbers.my_each_with_index { |item, index| puts "Item: #{item}, index: #{index}" }
puts "\n"
numbers.each_with_index { |item, index| puts "Item: #{item}, index: #{index}" }
puts "-----\n"

puts 'my_select vs. select'
p numbers.my_select { |item| item > 2 }
puts "\n"
p numbers.select { |item,| item > 2 }
puts "-----\n"

puts 'my_all? vs. all?'
p numbers.my_all? { |item| item > 3 }
puts "\n"
p numbers.all? { |item,| item > 3 }
puts "-----\n"

puts 'my_any? vs. any?'
p numbers.my_any? { |item| item > 3 }
puts "\n"
p numbers.any? { |item,| item > 3 }
puts "-----\n"

puts 'my_none? vs. none?'
p numbers.my_none? { |item| item > 6 }
puts "\n"
p numbers.none? { |item,| item > 6 }
puts "-----\n"

puts 'my_count vs. count'
puts numbers.my_count
puts "\n"
puts numbers.count
puts "-----\n"

my_proc = proc { |item| item * 2 }

puts 'my_map vs. map'
p numbers.my_map(my_proc)
puts "\n"
p numbers.map { |item| item * 2 }
puts "-----\n"

puts 'my_inject vs. inject'
p numbers.my_inject { |sum, n| sum + n }
puts "\n"
p numbers.inject { |sum, n| sum + n }
puts "-----\n"

def multiply_els(elements)
  elements.my_inject(1) { |product, num| product * num }
end

puts "multiply_els: #{multiply_els(numbers)}"

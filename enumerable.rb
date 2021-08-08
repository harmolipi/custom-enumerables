require 'pry-byebug'

module Enumerable
  def my_each
    for num in self
      yield num
    end
  end

  def my_each_with_index
    index = 0
    for num in self
      yield num, index
      index += 1
    end
  end

  def my_select
    selected = []
    my_each { |num| selected << num if yield num}
    selected
  end

  def my_all?
    all_true = true
    my_each { |num| all_true = false unless yield num }
    all_true
  end

  def my_any?
    my_each { |num| return true if yield num }
    false
  end

  def my_none?
    all_false = true
    my_each { |num| all_false = false if yield num }
    all_false
  end

  def my_count
    counter = 0
    my_each { counter += 1 }
    counter
  end

  def my_map(my_proc = nil)
    new_array = []
    if my_proc
      my_each_with_index { |num, index| new_array[index] = my_proc.call(num) }
    else
      my_each_with_index { |num, index| new_array[index] = yield num }
    end
    new_array
  end

  # def my_map
  #   new_array = []
  #   my_each_with_index { |num, index| new_array[index] = yield num }
  #   new_array
  # end

  def my_inject(start = 0)
    final_num = start
    my_each { |num| final_num = yield final_num, num }
    final_num
  end
end

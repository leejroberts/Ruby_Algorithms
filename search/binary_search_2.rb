require "pry"

array_1 = [1,2,3,4,5,6,7,8,9,10]


def search_array(search_array, search_value)
  low = 0
  high = search_array.length - 1
  while true
    middle = ( (low + high) / 2).ceil
    if low > high
      return - 1
    elsif search_value == search_array[middle]
      return middle
    elsif search_value < search_array[middle]
      high  = middle - 1
    elsif search_value > search_array[middle]
      low = middle + 1
    end
  end
end

puts search_array(array_1, 2)
puts search_array(array_1, 2.5)


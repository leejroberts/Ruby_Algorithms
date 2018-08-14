
array_1 = Array(1..10) # generates an array from a range


def bi_search(search_array, search_value, low=0, high=nil)
  high = high || search_array.length - 1
  middle = ((low + high) / 2 ).ceil
  if low > high
    return -1
  elsif search_value == search_array[middle]
    return middle
  elsif search_value < search_array[middle]
    high = middle - 1
  elsif search_value > search_array[middle]
    low = middle + 1
  end
  bi_search(search_array, search_value, low=low, high=high)
end


puts bi_search(array_1, 2)
puts bi_search(array_1, 2.5)

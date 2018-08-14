=begin

selection sort
  time complexity: O(N^2) or quadratic

basic action:
  loops through array indices
    at each index check the remainder of the array for a smaller number
    if found, switch the values
    move to next index
  at last index, return the mutated array

=end

def selection_sort(arr)

  arr.each_with_index() do |item, curr_i|
    lowest_i = curr_i

    # find the index with the lowest value
    for compare_i in (curr_i + 1)...arr.length do
      if arr[lowest_i] > arr[compare_i]
        lowest_i = compare_i
      end
    end

    # if the index with the lowest value is not the current index, switch their values
    if lowest_i != curr_i
      arr[lowest_i], arr[curr_i] = arr[curr_i], arr[lowest_i]
    end
  end

  return arr
end

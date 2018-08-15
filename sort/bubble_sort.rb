=begin

bubble sort algorithm in ruby

time complexity O(N^2) or quadratic

=end


def bubble_sort(arr)
  last_index_to_check = arr.length - 2

  switches_occurred = true # if no switches occur on a pass, the array is properly ordered

  while switches_occurred do
    switch_counter = 0

    arr.each_with_index do |_, index|

      break if index > last_index_to_check

      if arr[index] > arr[index+1]
        arr[index], arr[index+1] = arr[index+1], arr[index]
        switch_counter += 1
      end

      last_index_to_check -= 1
    end

    switches_occurred = false if switch_counter == 0

  end

  return arr
end

def​ ​partition!​(arr, left_pointer, right_pointer)
​ ​ ​# We always choose the right-most element as the pivot​​ 
  pivot_position = right_pointer​
  pivot = arr[pivot_position]​
​  # We start the right pointer immediately to the left of the pivot​​ 
  right_pointer -= 1​ ​ 
  ​while​ ​true​ ​do​​ ​ 
    ​while​ arr[left_pointer] < pivot ​do​​ 
      left_pointer += 1​       ​
    end​​
    while​ arr[right_pointer] > pivot ​do​​
      right_pointer -= 1​
    end​​
    if​ left_pointer >= right_pointer​
      break​​
    else​​
      arr[left_pointer], arr[right_pointer] = arr[right_pointer], arr[left_pointer]​
    end​
  end
  arr[left_pointer], arr[pivot_position] = arr[pivot_position], arr[left_pointer]

  return left_pointer
end

[4,5,3,11,33,7]

pivot_position = 5
pivot = 7
left_pointer = 2
right_pointer = 2

returns 2
mutated_arr = [4,5]

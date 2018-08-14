require 'set'

# Description
# Given an array of integers and a value, determine if there are any two integers in the array which sum equal to the given value.

# Consider this array and target sums.

# integers 5, 7, 1, 2, 8, 4, 3

# target values 10, 11 


array_1 = [5, 7, 1, 2, 8, 4, 3]
array_2 = [3, 4, 5, 1, 17, 99, 123, 44, 63, 44, 23, 35, 0, 222, 12, 23, 33, 66]


# lee's first method

def find_sum_rec( target_val, int_array )
    dup_array = int_array.dup
    current_int = dup_array.pop
    temp_array = []
    dup_array.each do |int|
        if current_int + int == target_val
            temp_array.push( current_int, int )
            break
        end
    end
    if !temp_array.empty?
        return temp_array
    elsif int_array.empty? 
        return false 
    else
        find_sum_rec( target_val, int_array )
    end
end

p find_sum_rec( 10, array_1 )

p array_1


array_1 = [5, 7, 1, 2, 8, 4, 3]

# Below solution is from coderust 
# find_sum_of_two function return true if
# there are two values in array who
# sum to value and returns false otherwise

def find_sum_of_two(arr, val)
  found_values = Set.new
  arr.each do |int|
    if found_values.include?(val - int)
      return true
    end

    found_values.add(int)
  end

  return false
end

p find_sum_of_two( array_1, 10 )


# coderust method would be faster, big O notation on mine == n^2, theirs == n log n



# reseting array
array_1 = [5, 7, 1, 2, 8, 4, 3]

# rewrite of above solution that returns the pair of numbers rather than true

def find_sum_with_values( arr, val )
    found_values = Set.new # set useful as it will eliminate duplicates
    arr.each do |int|
        if found_values.include?( val - int ) # sets can be rapidly searched
            return [ int, val - int ]
        end
        
        found_values.add( int )
    end
    
    return 'pair not found'    
            
end


p find_sum_with_values( array_1, 10 )

p array_1







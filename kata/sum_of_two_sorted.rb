# same as sum_of_two_values, but the array is pre-sorted ascending

array_1 = [5, 7, 1, 2, 8, 4, 3].sort!

p array_1


def sum_of_two(array, value )
    low = array.first
    high = array.last
    while ( low < high )
        if low + high == value
            return low, high
            break
        else
            low = array[ array.index_of(low) + 1 ]
                if low + high = value
                    return low, high
                    break
        
end

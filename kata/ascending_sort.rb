# sort array ascending (smallest to largest)

array  = [ 55, 23, 26, 2, 25 ]

# enumerable method
def enum_sort(array)
    array.sort{ |a,b| a <=> b }
end

# lee's method without enumerable sort using .min method
def min_sort(array)
    sorted_array = []
    loop do
        min = array.min
        sorted_array << min
        array.delete(min)
        if array.length == 0
            break
        end
    end
    return sorted_array
end

# without .sort or .min

def min_find(array)
    min = array[0]
    length = array.length
    index = 1
    while index < length
        if min > array[index]
            min = array[index]
        end
        index += 1
    end
    min
end

def min_find_sort(array)
    sorted_array = []
    while array.length > 0
        min = min_find(array)
        sorted_array << min
        array.delete(min)
    end 
    sorted_array
end

# due to method mutation of original array, others must be commented out to see results

p enum_sort(array)

# p min_sort(array)

# p min_find_sort(array)

#repeated using  Hoare's algorithm after viewing solution (first exposure to this algorithm)

array = [ 55, 23, 26, 2, 25 ]

def pivot(array, above: [], below: [])
    pivot = array[0]
    below_array = []
    above_array = []
    i = 1
    while i < array.length
        if  array[i] < pivot
            below_array << array[i]
        else
            above_array << array[i]
        end
    end
end



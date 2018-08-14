require 'pry'

# merge overlapping intervals

# coderrust challenge goal:
    # assume that each sub-array are beginning and end points of an interval
    # find all overlapping intervals and return the beginning and the end
    # ex: array = [ [1,3],[2,5] ] => [ [1,5] ]
    
# pseudo find the range
# shift the first array set from the array
# check to see if any of the other array sets overlap
# merge all overlapping arrays and unshift onto the front
# recursively call this function again with the second index
# continue until array[index] == array.last

array_1 = [ [1,5], [2, 10], [22, 45], [2, 5], [64, 66], [45, 77], [6,7], [22, 23], [33, 45], [66,67], [18, 22], [19, 22] ]

def array_merger(array, index = 0)
    if index == array.length - 1
        return array
    end
    active_array = array.delete_at(index)
    # binding.pry
    array.each_with_object(active_array) do |sub_array, active_array| 
        if sub_array[0] < sub_array[0] && active_array[0] < sub_array[1] && active_array[1] > sub_array[0] && active_array[1] > sub_array[1]
            array.delete(sub_array)
        elsif active_array[0] < sub_array[0] && active_array[1] > sub_array[0]
            active_array[1] = sub_array[1]
            array.delete(sub_array)
        elsif active_array[0] < sub_array[1] && active_array[1] > sub_array[1]
            active_array[0] = active_array[0]
            array.delete(sub_array)
        end
    end
    array.unshift(active_array)
    array_merger(array, index = index + 1)
end

p array_merger(array_1)



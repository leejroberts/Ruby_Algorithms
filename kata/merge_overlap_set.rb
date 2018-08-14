require 'pry'
require 'set'
# merge_overlap

# coderrust challenge goal:
    # assume that each sub-array are beginning and end points of an interval
    # find all overlapping intervals and return the beginning and the end
    # ex: array = [ [1,3],[2,5] ] => [ [1,5] ]
    
# pseudo-code 

# turn each sub-array into an a range.
# merge all the ranges into a Set to remove duplicate numbers then sort ascending.
# divide the set into sub-sets where there is a jump between numbers greater than +1
# iterate through the sub-sets turning them into arrays and returning the minmax..
    # as an array into the results array
# return results array.

array = [ [1,5], [2, 10], [22, 45], [2, 5], [64, 66], [45, 77], [6,7], [22, 23], [33, 45], [66,67], [18, 22], [19, 22] ]
array_2 = [ [1,5], [2, 10], [22, 45], [2, 5], [64, 66], [2, 8], [19, 23], [78, 79], [22, 22], [12, 14], [ 35, 58 ], [0,1], [1000, 1001] ]

def merger(array)
    set = Set.new 
    # creates an range from each pair and merges into the set
    array.each do |subarray|
        set.merge((subarray[0]..subarray[1]))
    end
    
    final_array = []
    # sorts set ascending, break on spaces greater than 1, returns the minmax 
    set.sort.to_set.divide{ |i,j| (i - j).abs == 1 }.each do |sub_set|
        final_array << sub_set.to_a.minmax
    end
    final_array
end

print merger(array)
print merger(array_2)
# thoughts on this attempt
# pro- it is useful from a programmmer standpoint the object types do most of the heavy lifting for you
#      it does not require a complicated logic tree or any recursion

# con- seems fairly inefficient requires looping through the objects multiple times
#      
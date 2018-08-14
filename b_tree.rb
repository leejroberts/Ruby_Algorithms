array = [1, 10, 20, 47, 59, 63, 75, 88, 99, 107, 120, 133, 155, 162, 176, 188, 199, 200, 210, 222]

def b_tree(num, arr, low, high)
    if low > high
        -1
    end
    pivot = low + ((high-low)/2)
    if arr[pivot] == num
        puts pivot
    elsif num < arr[pivot]
        b_tree(num, arr, low, pivot-1)
    else 
        b_tree(num, arr, pivot+1, high)
    end
end

b_tree(59, array, 0, array.length-1)

    
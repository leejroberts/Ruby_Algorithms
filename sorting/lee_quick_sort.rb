
array = [55, 10, 4, 7, 88, 97, 0, 55, 33, 2235, 1, 2, 4, 6]

# print quicksort(array)
def swap_array(array)
    if array[0] > array[1]
        temp = array[0]
        array[0] = array[1]
        array[1] = temp
    end
    array
end

def three_sort(array)
    pivot_i = (array.length / 2)
    pivot = array[pivot_i]
    array.delete_at(pivot_i)
    big_array = []
    small_array = []
    for i in (0...array.length)
        if array[i] <= pivot
            small_array << array[i]
        else
            big_array << array[i]
        end
    end
    return small_array + [pivot] + big_array
end

def quick_sort(array)
    if array.length <= 1
        array
    elsif array.length == 2
        swap_array(array)
    else
        pivot_i = (array.length / 2)
        pivot = array[pivot_i]
        array.delete_at(pivot_i)
        big_array = []
        small_array = []
        for i in (0...array.length)
            if array[i] <= pivot
                small_array << array[i]
            else
                big_array << array[i]
            end
        end
        quick_sort(small_array) + [pivot] + quick_sort(big_array)
    end
end

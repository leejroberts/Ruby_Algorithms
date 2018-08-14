array = [176, 188, 199, 200, 210, 222, 1, 10, 20, 47, 59, 63, 75, 88, 99, 107, 120, 133, 155, 162]

def search_rotate(value, array, low = 0, high = array.length - 1, mid = (low + (high-low)/2).floor)
    if low > high
        return -1
    elsif array[mid] == value
        return mid
    elsif array[low] < array[mid] && value >= array[low] && value < array[mid]
        search_rotate(value, array, low, mid-1)
    elsif array[low] < array[mid] && value > array[mid]
        search_rotate(value, array, mid + 1, high)
    elsif array[mid] < array[high] && value > array[mid] && value <= array[high]
        search_rotate(value, array, mid + 1, high)
    else
        search_rotate(value, array, low, mid-1)
    end
end

puts search_rotate(200, array)


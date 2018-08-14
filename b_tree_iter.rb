array = [1, 10, 20, 47, 59, 63, 75, 88, 99, 107, 120, 133, 155, 162, 176, 188, 199, 200, 210, 222]
num = 10
high = array.length - 1
low = 0

while low <= high
    mid = low + ((high - low)/2)
    if array[mid] == num
        puts mid
        break
    elsif num > array[mid]
        low = mid+1
    else
        high = mid-1
    end
    -1
end
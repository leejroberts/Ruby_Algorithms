# rotate an array  by n amount

array = [1, 10, 20, 47, 59, 63, 75, 88, 99, 107, 120, 133, 155, 162, 176, 188, 199, 200, 210, 222]

def rotator!(array, n = 1)
    chunk = array.pop(n).reverse
    array = array.reverse.push(chunk).flatten.reverse
    p array
end
# mutates the array
rotator!(array, 7)

array = [1, 10, 20, 47, 59, 63, 75, 88, 99, 107, 120, 133, 155, 162, 176, 188, 199, 200, 210, 222]

# mutates the array
def rotator_2!(array, n = 1)
    p array.unshift(array.pop(n))
end

rotator_2!(array, 5)
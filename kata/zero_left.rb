array = [1, 10, 20, 0, 59, 62, 0, 88, 0]

counter = 0
array.each do |i|
    if i == 0
        array.delete_at(counter)
        array.unshift(0)
    end
    counter = counter + 1
end

p array



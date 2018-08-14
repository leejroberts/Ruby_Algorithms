string1 = 'here is a string with some stuff in it!'

# attempt one using all ruby methods
def string_reverser(string)
    string.split(' ').reverse.join(' ')
end

p string_reverser(string1)

#challege 2: not utilizing reverse for added challenge

def string_reverser_wo(string)
    rev_array = []
    string_array = string.split(' ')
    string_array.each do |word|
        rev_array.unshift(word)
    end
    return rev_array.join(' ')
end

p string_reverser_wo(string1)

# challenge three: no use of each
def string_reverser3(string)
    string_array = string.split(' ')
    rev_array = []
    counter = 0
    while counter < string_array.length do
        rev_array.unshift(string_array[counter])
        counter += 1
    end
    return rev_array.join(' ')
end

p string_reverser3(string1)
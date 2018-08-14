# Description
# Given a string that contains duplicate occurrences of characters, remove these duplicate occurrences. 

# For example, if the input string is "abbabcddbabcdeedebc", 
# after removing duplicates it should become "abcde".

string = "abbabcddbabcdeedebczzzzz"

# using all available methods
def remove_dup(str)
    str.split('').uniq.join('')
end

p remove_dup(string)

# challenge 2 without uniq

def remove_dup2(str)
    string_array = str.split('')
    uniq_array = []
    string_array.each do |letter|
        unless uniq_array.include?(letter)
            uniq_array << letter
        end
    end
    return uniq_array.join
end

p remove_dup2(string)

# challenge 3 without converting initial string to array

def remove_dup3(str)
    index = 0
    uniq_string = ''
    while(index < str.length )        
        unless uniq_string.include?(str[index])
            uniq_string = uniq_string + str[index]
        end
        index += 1
    end
    return uniq_string
end

p remove_dup3(string)

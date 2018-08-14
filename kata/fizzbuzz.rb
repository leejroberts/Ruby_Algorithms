# fizzbuzz

# print the numbers one to 100 print fizz for numbers divisible by three buzz for numbers divisible by 5 and fizzbuzz for nubers divisible by 3 and 5

array = (1..100).to_a
def fizzbuzz(array)
    array.each do |i|
        if i % 3 == 0 && i % 5 == 0
            puts "fizzbuzz"
        elsif i % 5 == 0
            puts "buzz" 
        elsif i % 3 == 0 
            puts "fizz"
        else
            puts i
        end
    end
end

fizzbuzz(array)
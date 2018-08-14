prices = [10, 23, 4, 235, 233, 232, 45, 61, 0, 15, 188, 476 ]
prices2 = [4, 5, 6, 7, 8, 9, 10, 15, 17, 10, 11, 12, 13, 16, 10 ]
prices3 = [120, 110, 100, 98, 97, 96, 94, 95, 93, 92, 91, 90 ]
prices4 = (1..10).to_a.reverse

# 1st find the highest and lowest number in the array
# 2nd if the lowest number is to the right of the highest number return numbers with difference
# 3rd if the lowest number is NOT to the left of the highest number...
#   look for the highest number to the helft of the lowest number
#   look for the lowest number to the right of the highest number
#       compare the difference of the two sets...
#       return the set with the highest difference and the difference


def buy_sell(array)
  max = array.max
  max_i = array.index(max)
  min = array.min
  min_i = array.index(min)
  if array.index(min) < array.rindex(max)
    puts "Buy at #{min} sell at #{max} for a profit of #{max - min}"
  else
    min_array = array.take(max_i).to_a
    min_2 = min_array.min
    max_array = array.last(min_i + 1).to_a
    max_2 = max_array.max
    if ((min - max_2) > (min_2 - max))
      puts "Buy at #{min} sell at #{max_2} for a profit of #{max_2 - min}."
    else
      puts "Buy at #{min_2} sell at #{max} for a profit of #{max - min_2}."
    end
  end
end

# buy_sell(prices)
# buy_sell(prices2)
# buy_sell(prices3)


def buy_sell_2(array)
  buy = 0
  sell = 0
  max = -infinity
  array.each_with_index do |price, index|
    if array.last == price
      break
    end
    temp_sell = array.last(array.length - 1 - index).max
    if temp_sell - price > max
      buy = price
      sell = temp_sell
      max = temp_sell - price
    end
  end
  puts "Buy at #{buy} sell at #{sell} for a profit of #{max}"
end

buy_sell_2(prices)
p prices
buy_sell_2(prices2)
p prices2
buy_sell_2(prices3)
p prices3
buy_sell_2(prices4)
p prices4



array = [1, -10, 20, 47, -59, 63, 75, -8, 99, 17, 20, -13, 155, 2, 170000, 8, 99, -200, 10, 2]

def rolling_window_max(array, window, low = 0)
    if low + window < array.count - 1
        puts array.slice(low, window).max
        rolling_window_max(array, window, low + 1)
    end
end

rolling_window_max(array, 5)
    
    
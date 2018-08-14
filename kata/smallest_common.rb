arr1 = [6, 7, 10, 25, 30, 63, 64]
arr2 = [-1, 4, 5, 6, 7, 8, 10, 50]
arr3 = [1, 10, 14]

def smallest(arr1, arr2, arr3, ind1 = 0, ind2 = 0, ind3 = 0)
    
    if arr1[ind1] == arr2[ind2] && arr1[ind1] == arr3[ind3]
        puts arr1[ind1] #all match
        
    elsif arr1[ind1] <= arr2[ind2] && arr1[ind1] <= arr3[ind3]
        smallest(arr1, arr2, arr3, ind1 + 1, ind2, ind3 ) # 1 is the smallest
        
    elsif arr2[ind2] <= arr3[ind3] && arr3[ind3] > arr1[ind1]
        smallest(arr1, arr2, arr3, ind1 + 1, ind2, ind3) # 1 is the smallest
        
    elsif arr1[ind1] < arr2[ind2] && arr3[ind3] <= arr1[ind1]
        smallest(arr1, arr2, arr3, ind1, ind2, ind3 + 1) # 3 is the "smallest"
        
    elsif arr1[ind1] > arr2[ind2] && arr2[ind2] <= arr3[ind3]
        smallest(arr1, arr2, arr3, ind1, ind2 + 1, ind3 ) # 2 is the "smallest"
        
    elsif arr1[ind1] > arr2[ind2] && arr2[ind2] > arr3[ind3]
        smallest(arr1, arr2, arr3, ind1, ind2, ind3 + 1 ) # 3 is the "smallest"
        
    elsif arr1[ind1] == arr2[ind2] && arr2[ind2] > arr3[ind3]
        smallest(arr1, arr2, arr3, ind1, ind2, ind3 + 1 ) # 3 is the "smallest"
        
    else 
        smallest(arr1, arr2, arr3, ind1 + 1, ind2, ind3 ) # 1 is the "smallest"
    end
end

smallest(arr1, arr2, arr3)

# refactor this for less elsifs!!!
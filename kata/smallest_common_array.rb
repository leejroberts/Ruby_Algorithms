# smallest using an array
arr1 = [6, 7, 10, 25, 30, 63, 64]
arr2 = [-1, 4, 5, 6, 7, 8, 10, 50]
arr3 = [1, 6, 10, 14]


def smallest(arrA, arrB, arrC, indA = 0, indB = 0, indC = 0, array = [ arrA[indA], arrB[indB], arrC[indC] ])
    if array[0] == array[1] && array[1] == array[2]
        puts array[0]
    elsif array.index(array.min) == 0
        smallest(arrA, arrB, arrC, indA + 1, indB, indC)
    elsif array.index(array.min) == 1
        smallest(arrA, arrB, arrC, indA, indB + 1, indC)
    elsif array.index(array.min) == 2
        smallest(arrA, arrB, arrC, indA, indB, indC + 1)
    end
end

smallest(arr1, arr2, arr3)

# memory heavy due to recreation of arrays for each recursion but quick to write


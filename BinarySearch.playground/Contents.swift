import Foundation

/*
 
 Give an array X of intergers sorted in ascending order and an integer key,
 write a program to search for the key in X,
 if the key exists, then return its index else return -1
 
 input X[] = [-4, 2, 4, 5, 9, 12], key = 5, output: 3
 input X[] = [-4, 2, 4, 5, 9, 12], key = 6, output: -1

 
 */

func binarySearch(X: [Int], key: Int, left: Int, right: Int) -> Int {
    if left > right {
        return -1
    }
    
   let mid = left+(right-left)/2
    if X[mid] == key {
        return mid
    }
    
    if X[mid] > key {
        return binarySearch(X: X, key: key, left:left, right:mid-1)
    } else {
        return binarySearch(X: X, key: key, left: mid+1, right:right)
    }
}

let X: [Int] = [-4, 2, 4, 5, 9, 12]
var key = 5

print( binarySearch(X: X, key: key, left: 0, right: X.count - 1) )

key = 6

print( binarySearch(X: X, key: key, left: 0, right: X.count - 1) )


func binarySearchIterative(X: [Int], key: Int) -> Int {
    var findAt =  -1
    var left = 0
    var right = X.count - 1
    while left <= right {
        let mid = left + (right-left)/2
        if X[mid] == key {
            findAt = mid
            break
        } else if X[mid] > key {
            right = mid - 1
        } else  {
            left = mid + 1
        }
    }
    return findAt
}

key = 5
print( binarySearchIterative(X: X, key: key) )
key = 6
print( binarySearchIterative(X: X, key: key) )


/*
 Binary Search
 Given an array of Integers that is intially increasing and then decreasing, find the maximum value in the array, Hind: Keep in mind the corner cases
 input: X[] = [18, 110, 210, 452, 810, 500, 101, 13] output: 810
 input: X[] = [1, 2, 3, 4, 5] output: 5

 */
func firstIncreaseThenDecressingFindMaximumBrusForceLinearSearch(X: [Int]) -> Int {
    var max = X[0]
    for i in 1..<X.count {
        if X[i] > max {
            max = X[i]
        } else {
            break
        }
    }
    return max
}

print(firstIncreaseThenDecressingFindMaximumBrusForceLinearSearch(X: [18, 110, 210, 452, 810, 500, 101, 13]))
print(firstIncreaseThenDecressingFindMaximumBrusForceLinearSearch(X: [1, 2, 3, 4, 5]))


func firstIncreaseThenDecressingFindMaximumBrusForceBinarySearch(X: [Int], left: Int, right: Int) -> Int {
    var max = X[0]
    if left == right {
        return X[left]
    }
    return max
}

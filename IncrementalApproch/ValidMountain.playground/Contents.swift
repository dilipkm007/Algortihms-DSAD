import UIKit

/*
 Check array is valid mountian or not
 There are two approch we can solve this problem
 1. Traverse from left to right
 2. Traverse in opposite direction
 */

/*
 In left to right first we move toward right in check increasing order once it went to decrease order we stop and set pevious element as peak
 now we move second loop from peak to last element and check if
 
 */

func isValidMountain(array: [Int]) -> Bool {
    var isValid = false
    let n = array.count
    guard n > 2 else { return isValid }
    var climb = 0
    while climb < n - 1 && array[climb] < array[climb + 1] {
        climb += 1
    }
    if climb == 0 && climb == n - 1 {
        return isValid
    }
    
    while climb < n - 1 && array[climb] > array[climb + 1] {
        climb += 1
    }
    if climb == n - 1 {
        isValid = true
    }
    return isValid
}

print(isValidMountain(array: [5, 2, 1, 4]))
print(isValidMountain(array: [5, 8, 8]))
print(isValidMountain(array: [1, 2, 6, 5, 3]))


func isValidMountainOppositeDirection(array: [Int]) -> Bool {
    var isValid = false
    let n = array.count
    guard n > 2 else { return isValid }
    var left = 0, right = n - 1
    while left < n - 1 && array[left] < array[left + 1] {
        left += 1
    }
    while right > 0 && array[right - 1] > array[right] {
        right =  right - 1
    }
    
    if left > 0 && left == right && right < n - 1 {
        isValid = true
    }
    return  isValid
}
print()
print(isValidMountainOppositeDirection(array: [5, 2, 1, 4]))
print(isValidMountainOppositeDirection(array: [5, 8, 8]))
print(isValidMountainOppositeDirection(array: [1, 2, 6, 5, 3]))


/* Valley and Peak count of mountina if array is valid peak shoul 1 and valley should zero*/

func isValidVallyPeaksAndValleys(array: [Int]) -> Bool {
     let n = array.count
     guard n > 2 else { return false }
     var peakCount = 0
     var valleyCount = 0
    for i in 1..<n-1 {
        if array[i] > array[i - 1] && array[i] > array[i + 1] {
            peakCount += 1
        } else if array[i] < array[i-1] && array[i] < array[i + 1] {
            valleyCount += 1
        }
    }
    
    return peakCount == 1 && valleyCount == 0
}

print()
print(isValidVallyPeaksAndValleys(array: [5, 2, 1, 4]))
print(isValidVallyPeaksAndValleys(array: [5, 8, 8]))
print(isValidVallyPeaksAndValleys(array: [1, 2, 6, 5, 3]))

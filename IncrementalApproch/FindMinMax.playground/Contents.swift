import UIKit

//Find Maximum and minimum using minimum number of comparisons

//Problem to learn problem solving using a single loop and divide-and-conquer approch


/*
 Problem: Given an array X[] of size n, we need to find the maximum and minimum elements present in the array. our algorithm should make the minimum
 number of comparison
    input: X[] = [2, 4, 6, 1, 8, 10]
    output: max = 10, min = 1
    input: X[] = [-2, -4, -6, -1, -8, -10]
    output: max = -1, min = -10
    Q: Are given value in array unique? Yes
    Q: Do we solve this problem inplace? yes O(n)
 
    BrustForce: Single Loop: increament by 1
    Divide and conquer: Merge sort
    Effiecient approch: Increment by 2
 */

let a1 = [2, 4, 6, 1, 8, 10]
let a2 = [-2, -4, -6, -1, -8, -10]

func brustForceApproch(_ array: [Int]) -> [Int] {
    guard array.count > 0 else {
            return []
    }
    var max = array[0]
    var min = array[0]
    for i in 0..<array.count {
        if array[i] > max {
            max = array[i]
        }
        if array[i] < min {
            min = array[i]
        }
    }
   
    return [max, min]
}
print("brustForceApproch way")
print(brustForceApproch(a1))
print(brustForceApproch(a2))


/*
 Think can we solve this problem using two halves array
 Using Divide and conquer
 
 Devide: Divide problem/array two equal parts
 Conquer: We recurceivly find the minimum and mazximum  of left and right part
 Combine: we compare maximum and minimum both halves adn conclude final max and min
 */

func divideAndConquer(array: [Int], start: Int, end: Int, _ leftRight: String) -> [Int] {
    var max = 0, min = 0
    if start == end {
        max = array[start]
        min = array[end]
    } else if(start+1 == end) {
        if array[start] < array[end] {
            max = array[end]
            min = array[start]
        } else {
            max = array[start]
            min = array[end]
        }
    } else {
        let mid: Int = start + (end - start)/2
        let leftMinMax = divideAndConquer(array: array, start: start, end: mid, "left")
        let rightMinMax = divideAndConquer(array: array, start: mid+1, end: end, "right")
        if leftMinMax[0] > rightMinMax[0]{
            max = leftMinMax[0]
        } else {
            max = rightMinMax[0]
        }
        if leftMinMax[1] < rightMinMax[1] {
            min = leftMinMax[1]
        } else {
            min = rightMinMax[1]
        }
    }
    
    return[max, min]
}
print("divideAndConquer way")
print(divideAndConquer(array:a1 , start: 0, end:a1.count-1, "first"))
print(divideAndConquer(array: a2, start: 0, end: a2.count-1, "first"))

/*
 Effcient Approch: Using single loop: Increment by 2
 It will reduce count of comprisions
 */


func findMinMax(_ array: [Int]) -> [Int] {
    var min = 0, max = 0, i = 0
    let n = array.count
    
    if n % 2 != 0 {
        max = array[0]
        min = array[0]
        i = 1
    } else {
        if array[0] < array[1] {
            max = array[1]
            min = array[0]
        } else {
            max = array[0]
            min = array[1]
        }
         i = 2
    }
    
    while i < n {
        if array[i] < array[i + 1] {
            if array[i] < min {
                min = array[i]
            }
            if array[i+1] > max {
                max = array[i + 1]
            }
        } else {
            if array[i+1] < min {
                min = array[i + 1]
            }
            if array[i] > max {
                max = array[i]
            }
        }
        i = i + 2
    }
    
    return [max, min]
}
print("Effcient way")
print(findMinMax(a1))
print(findMinMax(a2))

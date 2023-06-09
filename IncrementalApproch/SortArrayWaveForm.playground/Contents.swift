import UIKit
/*
    Problem on sorting and single loop jumb by 2
 Given an unsorted array of n integers, write a program to sort the array into wave array 
 
 Sort array A[n] in wave arrangement: A[0]>=A[1]<=a[2]>=A[3]<=A[4].....
 Input: A[] = [1, 2, 3, 4] Output: [2, 1, 4, 3] or [4, 1, 3, 2] or any other wave form
 Input: A[] = [20, 10, 8, 6, 4, 2] output: [20, 8, 10, 4, 6, 2] or [10, 8, 20, 6, 2]
 */


func brustForce(arr: inout [Int]) {
    arr.sort()
    for i in stride(from: 0, to: arr.count-1, by: 2) {
        (arr[i], arr[i+1]) =  (arr[i+1], arr[i])
    }
}


var arr = [1, 2, 3, 4]
brustForce(arr: &arr)
print(arr)

var arr1 = [20, 10, 8, 6, 4, 2]
brustForce(arr: &arr1)
print(arr1)


func optimized(arr: inout [Int]) {
    for i in stride(from: 0, to: arr.count-1, by: 2) {
        if i > 0 && arr[i-1] > arr[i] {
            (arr[i], arr[i-1]) =  (arr[i-1], arr[i])
        } else if i < arr.count-1 && arr[i] < arr[i+1] {
            (arr[i], arr[i+1]) =  (arr[i+1], arr[i])
        }
    }
}

var arr2 = [1, 2, 3, 4]
optimized(arr: &arr2)
print(arr2)

var arr3 = [20, 10, 8, 6, 4, 2]
optimized(arr: &arr3)
print(arr3)

var arr4 = [3, 9, 6, 15, 12, 18]
optimized(arr: &arr4)
print(arr4)

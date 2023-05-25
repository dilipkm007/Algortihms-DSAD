import UIKit

//var greeting = "Hello, playground"
/*
 Write a program that find the equilibrium index of an array. The equilibrium index of an array is an index such that sum of elements at lower indexes is equal to the sum of elements at higher indexes.
 A[0]+A[1]+A[2]+.....+A[i-1] = A[i+1]+A[i+2]+A[i+3]+......+A[n-1]
 Exaple: input: [-7, 1, 5, 2, -4, 3, 0] output: 3
         input: [0, 1, 3, -2, -1] output: 1
         input: [1, 2, -2, -1] output: -1 //no such equilibrium
 */
/*
 Assumption: for i = 0; Sum of elements at lower indexes is equal to 0
 for i = n-1; Sum of elements at higher indexes is equal to 0
 */

/*
    1. Brust force Approch(Nested Loop)
    2. Using prefix sum array and single loop
    3. Efficient approch using single loop
 */

func brustForceEquilibrium(array: [Int]) -> Int {
    
    var equilibriumIndex = -1
    let n  = array.count
    var leftSum = 0
    var rightSum = 0
    
    for i in 0..<n {
        leftSum = 0
        rightSum = 0
        for j in 0..<n {
            if j < i  {
                leftSum = leftSum + array[j]
            }
            if j > i {
                rightSum = rightSum + array[j]
            }
        }
        if leftSum == rightSum {
            equilibriumIndex = i
            break
        }
    }
    return equilibriumIndex
}

print(brustForceEquilibrium(array:[-7, 1, 5, 2, -4, 3, 0]))
print(brustForceEquilibrium(array:[0, 1, 3, -2, -1]))
print(brustForceEquilibrium(array:[1, 2, -2, -1]))

func prefixSumArray(array: [Int]) -> Int{
    let n = array.count
    var leftSum = 0
    var rightSum = 0
    var equilibriumIndex = -1
    var prefix = Array(repeating: 0, count: n)
    for i in 0..<n {
        if i == 0 {
            prefix[i] = array[i]
        } else {
            prefix[i] = prefix[i - 1] + array[i]
        }
    }
    let totalSum = array.reduce(0, +)
    for i in 0..<n {
        leftSum = prefix[i] - array[i]
        rightSum = totalSum - prefix[i]
        if leftSum == rightSum {
            equilibriumIndex = i
            break
        }
    }
    return equilibriumIndex
}
print()
print(prefixSumArray(array: [-7, 1, 5, 2, -4, 3, 0]))
print(prefixSumArray(array:[0, 1, 3, -2, -1]))
print(prefixSumArray(array:[1, 2, -2, -1]))

func efficientApproch(array: [Int]) -> Int {
    var totalSum = array.reduce(0, +)
    var leftSum = 0
    let n = array.count
    
    for i in 0..<n {
        let rightSum = totalSum - leftSum - array[i]
        if leftSum == rightSum {
            return i
        }
        leftSum = leftSum + array[i]
    }
    return -1
}

print()
print(efficientApproch(array: [-7, 1, 5, 2, -4, 3, 0]))
print(efficientApproch(array:[0, 1, 3, -2, -1]))
print(efficientApproch(array:[1, 2, -2, -1]))

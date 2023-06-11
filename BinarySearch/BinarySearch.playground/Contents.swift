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

/*
 
 A peak element is an element that is strictly greater than its neighbors.

 Given a 0-indexed integer array nums, find a peak element, and return its index. If the array contains multiple peaks, return the index to any of the peaks.

 You may imagine that nums[-1] = nums[n] = -∞. In other words, an element is always considered to be strictly greater than a neighbor that is outside the array.

 You must write an algorithm that runs in O(log n) time.

 Example 1:

 Input: nums = [1,2,3,1]
 Output: 2
 Explanation: 3 is a peak element and your function should return the index number 2.
 Example 2:

 Input: nums = [1,2,1,3,5,6,4]
 Output: 5
 Explanation: Your function can return either index number 1 where the peak element is 2, or index number 5 where the peak element is 6.
 
 */
 func findPeakElement(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = left + (right - left)/2
            if ( mid == 0 || nums[mid-1] < nums[mid]) && (mid ==  nums.count-1  ||  nums[mid] > nums[mid+1]){
                return mid
            }

            if mid == 0 || nums[mid-1] < nums[mid]  {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return -1
    }




print(findPeakElement([1,2,3,1]))
print(findPeakElement([1,2,1,3,5,6,4]))

/*
 
 You are given an m x n integer matrix matrix with the following two properties:

 Each row is sorted in non-decreasing order.
 The first integer of each row is greater than the last integer of the previous row.
 Given an integer target, return true if target is in matrix or false otherwise.

 You must write a solution in O(log(m * n)) time complexity.
 
 
 Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
 Output: true
 
 Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
 Output: false
 
 */

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty else { return false}
        let m = matrix.count
        let n = matrix[0].count

        var left = 0
        var right = m * n - 1
        while left <= right {
            let mid = left + (right - left)/2
            let el = matrix[mid/n][mid%n]
            guard el != target else { return true }
            if el < target  {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return false
    }


print(searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3))
print(searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13))

/*
 Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well.

 You must not use any built-in exponent function or operator.

 For example, do not use pow(x, 0.5) in c++ or x ** 0.5 in python.

 Example 1:

 Input: x = 4
 Output: 2
 Explanation: The square root of 4 is 2, so we return 2.
 Example 2:

 Input: x = 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since we round it down to the nearest integer, 2 is returned.
 
 
 */

func mySqrt(_ x: Int) -> Int {
      guard x > 3 else { return x == 0 ? 0: 1}
      var (l, r) = (0, x/2)

      while l <= r {
          let mid = (l+r)/2
          let res = mid * mid
          if res == x {
              return mid
          } else {
              res < x ? (l = mid + 1) : (r = mid - 1)
          }
      }

      return r
  }



print(mySqrt(4))
print(mySqrt(8))

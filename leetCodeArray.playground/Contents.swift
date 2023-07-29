import UIKit

/*
 Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Then return the number of unique elements in nums.
 
 Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:
 
 Change the array nums such that the first k elements of nums contain the unique elements in the order they were present in nums initially. The remaining elements of nums are not important as well as the size of nums.
 Return k.
 
 
 
 
 Example 1:
 
 Input: nums = [1,1,2]
 Output: 2, nums = [1,2,_]
 Explanation: Your function should return k = 2, with the first two elements of nums being 1 and 2 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 Example 2:
 
 Input: nums = [0,0,1,1,1,2,2,3,3,4]
 Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]
 Explanation: Your function should return k = 5, with the first five elements of nums being 0, 1, 2, 3, and 4 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 
 
 Constraints:
 
 1 <= nums.length <= 3 * 104
 -100 <= nums[i] <= 100
 nums is sorted in non-decreasing order.
 
 
 */

func removeDuplicates(_ nums: inout [Int]) -> Int {
    //Two pointers
    var i = 0
    var j = 1
    while j < nums.count {
        if nums[i] != nums[j] {
            i += 1
            nums.swapAt(i, j)
        }
        j += 1
    }
    return i+1
}

print("=== Remove Duplicates from Sorted Array ===")

var nums = [1,1,2]
print("> \(nums)")
let k = removeDuplicates(&nums)
print("< \(nums[0..<k])")

nums = [0,0,1,1,1,2,2,3,3,4]
print("> \(nums)")
let k1 = removeDuplicates(&nums)
print("< \(nums[0..<k1])")


print("============================================ \n")



/*
 You are given an integer array prices where prices[i] is the price of a given stock on the ith day.
 
 On each day, you may decide to buy and/or sell the stock. You can only hold at most one share of the stock at any time. However, you can buy it then immediately sell it on the same day.
 
 Find and return the maximum profit you can achieve.
 
 
 Example 1:
 
 Input: prices = [7,1,5,3,6,4]
 Output: 7
 Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
 Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
 Total profit is 4 + 3 = 7.
 Example 2:
 
 Input: prices = [1,2,3,4,5]
 Output: 4
 Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
 Total profit is 4.
 Example 3:
 
 Input: prices = [7,6,4,3,1]
 Output: 0
 Explanation: There is no way to make a positive profit, so we never buy the stock to achieve the maximum profit of 0.
 
 
 Constraints:
 
 1 <= prices.length <= 3 * 104
 0 <= prices[i] <= 104
 
 */

func maxProfit(_ prices: [Int]) -> Int {
    var profit = 0
    for i in 1..<prices.count {
        if prices[i] > prices[i-1] {
            profit = profit + (prices[i] - prices[i-1])
        }
    }
    return profit
}
print("=== Best Time to Buy and Sell Stock II ===")

print("> [7,1,5,3,6,4] \n< \(maxProfit([7,1,5,3,6,4]))")
print("> [1,2,3,4,5] \n< \(maxProfit([1,2,3,4,5]))")
print("> [7,6,4,3,1] \n< \(maxProfit([7,6,4,3,1]))")
print("> [1, 2, 1, 5] \n< \(maxProfit([1, 2, 1, 5]))")
print("============================================ \n")
/*
 Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.
 
 
 
 Example 1:
 
 Input: nums = [1,2,3,4,5,6,7], k = 3
 Output: [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 Example 2:
 
 Input: nums = [-1,-100,3,99], k = 2
 Output: [3,99,-1,-100]
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]
 
 
 Constraints:
 
 1 <= nums.length <= 105
 -231 <= nums[i] <= 231 - 1
 0 <= k <= 105
 
 */

func roatate(_ nums: inout [Int], _ k: Int) {
    let n = nums.count
    var numCopy = nums
    for i in 0..<n {
        let j = (i+k)%n
        nums[j] = numCopy[i]
    }
}

print("=== Rotate Array ===")
nums = [1,2,3,4,5,6,7]
print("> \(nums)")
roatate(&nums, 3)
print("< \(nums)")
nums = [-1,-100,3,99]
print("> \(nums)")
roatate(&nums, 2)
print("< \(nums)")
print("============================================ \n")


/*
 
 
 Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
 
 
 
 Example 1:
 
 Input: nums = [1,2,3,1]
 Output: true
 Example 2:
 
 Input: nums = [1,2,3,4]
 Output: false
 Example 3:
 
 Input: nums = [1,1,1,3,3,4,3,2,4,2]
 Output: true
 
 
 Constraints:
 
 1 <= nums.length <= 105
 -109 <= nums[i] <= 109
 
 */


func containsDuplicate(_ nums: [Int]) -> Bool {
    var seen = Set<Int>()
    for num in nums {
        if seen.contains(num) {
            return true
        }
        seen.insert(num)
    }
    return false
}

print("=== Contains Duplicate ===")

print("> [1,2,3,1] \n< \(containsDuplicate([1,2,3,1]))")
print("> [1,2,3,4] \n< \(containsDuplicate([1,2,3,4]))")
print("> [1,1,1,3,3,4,3,2,4,2] \n< \(containsDuplicate([1,1,1,3,3,4,3,2,4,2]))")
print("============================================ \n")


/*
 
 Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
 
 You must implement a solution with a linear runtime complexity and use only constant extra space.
 
 
 
 Example 1:
 
 Input: nums = [2,2,1]
 Output: 1
 Example 2:
 
 Input: nums = [4,1,2,1,2]
 Output: 4
 Example 3:
 
 Input: nums = [1]
 Output: 1
 
 
 Constraints:
 
 1 <= nums.length <= 3 * 104
 -3 * 104 <= nums[i] <= 3 * 104
 Each element in the array appears twice except for one element which appears only once.
 
 */

func singleNumber(_ nums: [Int]) -> Int {
    var result = 0
    for num in nums {
        result ^= num
    }
    return result
}

print("=== Single Number ===")

print("> [2,2,1] \n< \(singleNumber([2,2,1]))")
print(">[4,1,2,1,2] \n< \(singleNumber([4,1,2,1,2]))")
print("> [1] \n< \(singleNumber([1]))")
print("============================================ \n")


/*
 
 Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.
 
 
 
 Example 1:
 
 Input: nums1 = [1,2,2,1], nums2 = [2,2]
 Output: [2,2]
 Example 2:
 
 Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 Output: [4,9]
 Explanation: [9,4] is also accepted.
 
 
 Constraints:
 
 1 <= nums1.length, nums2.length <= 1000
 0 <= nums1[i], nums2[i] <= 1000
 
 
 Follow up:
 
 What if the given array is already sorted? How would you optimize your algorithm?
 What if nums1's size is small compared to nums2's size? Which algorithm is better?
 What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
 
 
 */


func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var frequencyDict = [Int: Int]()
    var intersectionArray = [Int]()
    for num in nums1 {
        frequencyDict[num, default: 0] += 1
    }
    
    for num in nums2 {
        if let count = frequencyDict[num], count > 0 {
            intersectionArray.append(num)
            frequencyDict[num] = count - 1
        }
    }
    return intersectionArray
}

print("=== Intersection of Two Arrays II ===")

print("> [1,2,2,1]  [2,2]\n< \(intersect([1,2,2,1], [2,2]))")
print(">[4,9,5]  [9,4,9,8,4]\n< \(intersect([4,9,5],  [9,4,9,8,4]))")
print("============================================ \n")

/*
 You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.
 
 Increment the large integer by one and return the resulting array of digits.
 
 
 
 Example 1:
 
 Input: digits = [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 Incrementing by one gives 123 + 1 = 124.
 Thus, the result should be [1,2,4].
 Example 2:
 
 Input: digits = [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 Incrementing by one gives 4321 + 1 = 4322.
 Thus, the result should be [4,3,2,2].
 Example 3:
 
 Input: digits = [9]
 Output: [1,0]
 Explanation: The array represents the integer 9.
 Incrementing by one gives 9 + 1 = 10.
 Thus, the result should be [1,0].
 
 
 Constraints:
 
 1 <= digits.length <= 100
 0 <= digits[i] <= 9
 digits does not contain any leading 0's.
 
 
 
 */


func plusOne(_ digits: [Int]) -> [Int] {
    var carry = 1
    var result = digits
    for i in stride(from: result.count - 1, to: -1, by: -1) {
        result[i] += carry
        if result[i] == 10 {
            result[i] = 0
            carry = 1
        } else {
            carry = 0
        }
    }
    
    if carry == 1 {
        result.insert(1, at: 0)
    }
    return result
}

print("=== Plus One ===")

print("> [1,2,3] \n< \(plusOne([1,2,3]))")
print(">[4,3,2,1] \n< \(plusOne([4,3,2,1]))")
print("> [9] \n< \(plusOne([9]))")
print("============================================ \n")

/*
 
 Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 
 Note that you must do this in-place without making a copy of the array.
 
 
 
 Example 1:
 
 Input: nums = [0,1,0,3,12]
 Output: [1,3,12,0,0]
 Example 2:
 
 Input: nums = [0]
 Output: [0]
 
 
 Constraints:
 
 1 <= nums.length <= 104
 -231 <= nums[i] <= 231 - 1
 
 
 Follow up: Could you minimize the total number of operations done?
 */

func moveZeroes(_ nums: inout [Int]) {
    var nonZeroIndex = 0
    for i in 0..<nums.count {
        if nums[i] != 0 {
            nums.swapAt(i, nonZeroIndex)
            nonZeroIndex += 1
        }
    }
}

print("===  Move Zeroes ===")
nums =  [0,1,0,3,12]
print("> \(nums)")
moveZeroes(&nums)
print("< \(nums)")
nums = [0]
print("> \(nums)")
moveZeroes(&nums)
print("< \(nums)")
print("============================================ \n")



/*
 
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 You can return the answer in any order.

  

 Example 1:

 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 Example 2:

 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 Example 3:

 Input: nums = [3,3], target = 6
 Output: [0,1]
  

 Constraints:

 2 <= nums.length <= 104
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 Only one valid answer exists.
  

 Follow-up: Can you come up with an algorithm that is less than O(n2) time complexity?
 
 
 
 
 
 */


func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
       var dict = [Int: Int]()
       var arr = [Int]()
       for i in 0..<nums.count {
           let remain = target - nums[i]
           if let val = dict[remain] {
               arr.append(val)
               arr.append(i)
               break
           } else {
             dict[nums[i]] = i
           }
       }
       
       return arr
   }


print("=== Two Sum ===")

print(">  [2,7,11,15] \n< \(twoSum( [2,7,11,15], 9))")
print(">  [3,2,4] \n< \(twoSum( [3,2,4], 6))")
print(">  [3,3] \n< \(twoSum(  [3,3] , 6))")
print("============================================ \n")


/*
 
 
 
 Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

 Each row must contain the digits 1-9 without repetition.
 Each column must contain the digits 1-9 without repetition.
 Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
 Note:

 A Sudoku board (partially filled) could be valid but is not necessarily solvable.
 Only the filled cells need to be validated according to the mentioned rules.
  

 Example 1:


 Input: board =
 [["5","3",".",".","7",".",".",".","."]
 ,["6",".",".","1","9","5",".",".","."]
 ,[".","9","8",".",".",".",".","6","."]
 ,["8",".",".",".","6",".",".",".","3"]
 ,["4",".",".","8",".","3",".",".","1"]
 ,["7",".",".",".","2",".",".",".","6"]
 ,[".","6",".",".",".",".","2","8","."]
 ,[".",".",".","4","1","9",".",".","5"]
 ,[".",".",".",".","8",".",".","7","9"]]
 Output: true
 Example 2:

 Input: board =
 [["8","3",".",".","7",".",".",".","."]
 ,["6",".",".","1","9","5",".",".","."]
 ,[".","9","8",".",".",".",".","6","."]
 ,["8",".",".",".","6",".",".",".","3"]
 ,["4",".",".","8",".","3",".",".","1"]
 ,["7",".",".",".","2",".",".",".","6"]
 ,[".","6",".",".",".",".","2","8","."]
 ,[".",".",".","4","1","9",".",".","5"]
 ,[".",".",".",".","8",".",".","7","9"]]
 Output: false
 Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.
  

 Constraints:

 board.length == 9
 board[i].length == 9
 board[i][j] is a digit 1-9 or '.'.
 
 
 
 
 */

func isValidSudoku(_ board: [[Character]]) -> Bool {
      var dict = [Character: Bool]()
       for i in 0..<board[0].count {
           dict.removeAll()
           for j in 0..<board[0].count {
               if let _ = dict[board[i][j]] {
                   return false
               }
               if board[i][j].isNumber {
                   dict[board[i][j]] = true
               }
               
           }
       }
       
        for i in 0..<board[0].count {
           dict.removeAll()
           for j in 0..<board[0].count {
               if let _ = dict[board[j][i]] {
                   return false
               }
               if board[j][i].isNumber {
                   dict[board[j][i]] = true
               }
               
           }
       }
       
       for i in stride(from: 0, to: 9, by: 3) {
           for j in stride(from: 0, to: 9, by: 3) {
              dict.removeAll()
               for k in i..<i+3 {
                   for l in j..<j+3 {
                       let cell = board[k][l]
                       if cell.isNumber {
                           if let _ = dict[cell] {
                               return false
                           }
                           dict[cell] = true
                       }
                   }

               }

           }
       }
       
       return true
   }

print("===  Valid Sudoku ===")

var board: [[Character]] =
[["5","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]

print("> \(board) \n< \(isValidSudoku( board))")

board =
[["8","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]

print("> \(board) \n< \(isValidSudoku( board))")
print("============================================ \n")


/*
 
 You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).

 You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

  

 Example 1:


 Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
 Output: [[7,4,1],[8,5,2],[9,6,3]]
 Example 2:


 Input: matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
 Output: [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
  

 Constraints:

 n == matrix.length == matrix[i].length
 1 <= n <= 20
 -1000 <= matrix[i][j] <= 1000
 
 */


func rotate(_ matrix: inout [[Int]]) {
     for row in 0..<matrix.count {
      for col in row..<matrix.count {
          let temp = matrix[row][col]
          matrix[row][col] = matrix[col][row]
          matrix[col][row] = temp
      }
  }
  
  for i in 0..<matrix.count {
      for j in 0..<matrix.count/2 {
          let temp = matrix[i][j]
          matrix[i][j] = matrix[i][matrix.count-1-j]
          matrix[i][matrix.count-1-j] = temp
      }
  }
  }


print("===  Valid Sudoku ===")

var matrix = [[1,2,3],[4,5,6],[7,8,9]]
print("> \(matrix)")
rotate(&matrix)
print("< \(matrix)")
matrix =  [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
print("> \(matrix)")
rotate(&matrix)
print("< \(matrix)")
print("============================================ \n")

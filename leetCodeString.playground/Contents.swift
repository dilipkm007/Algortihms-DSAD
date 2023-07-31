import UIKit

/*
 Write a function that reverses a string. The input string is given as an array of characters s.

 You must do this by modifying the input array in-place with O(1) extra memory.

  

 Example 1:

 Input: s = ["h","e","l","l","o"]
 Output: ["o","l","l","e","h"]
 Example 2:

 Input: s = ["H","a","n","n","a","h"]
 Output: ["h","a","n","n","a","H"]

 
 */

func reverseString(_ s: inout [Character]) {
       var leftPointer = 0
       var rightPointer = s.count - 1
       
       while leftPointer < rightPointer {
           s.swapAt(leftPointer, rightPointer)
           leftPointer += 1
           rightPointer -= 1
       }
   }
print("========= Reverse String ======================= ")
var  s:[Character]  = ["h","e","l","l","o"]
print("> \(s)")
reverseString(&s)
print("< \(s)")
s = ["H","a","n","n","a","h"]
print("> \(s)")
reverseString(&s)
print("< \(s)")
print()


/*
 
 Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

 Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

  

 Example 1:

 Input: x = 123
 Output: 321
 Example 2:

 Input: x = -123
 Output: -321
 Example 3:

 Input: x = 120
 Output: 21
  

 Constraints:

 -231 <= x <= 231 - 1
 
 
 */

func reverseInteger(_ x: Int) -> Int {
    var rev = 0
    var y = abs(x)
    while y > 0 {
        rev = rev * 10 + y % 10
        y /= 10
        let intmax = Int(pow(Double(2), Double(31)))
        if (rev > intmax - 1 || rev < -intmax) {
            return 0
        }
    }
    return  x < 0 ? -rev : rev
}

print("========= Reverse Integer ======================= ")
print(reverseInteger(123))
print(reverseInteger(-123))
print(reverseInteger(120))
print()

/*
 First Unique Character in a String


 Given a string s, find the first non-repeating character in it and return its index. If it does not exist, return -1.

  

 Example 1:

 Input: s = "leetcode"
 Output: 0
 Example 2:

 Input: s = "loveleetcode"
 Output: 2
 Example 3:

 Input: s = "aabb"
 Output: -1
  

 Constraints:

 1 <= s.length <= 105
 s consists of only lowercase English letters.
 
 
 */

func firstUniqChar(_ s: String) -> Int {
    var dict = [Character: Int]()
    for char in s {
        dict[char, default: 0] += 1
    }
    
    for (index, char) in s.enumerated() {
        if dict[char] == 1 {
            return index
        }
    }
    return -1
}


print("========= First Unique Character in a String ======================= ")
print(firstUniqChar("leetcode"))
print(firstUniqChar("loveleetcode"))
print(firstUniqChar("aabb"))
print()

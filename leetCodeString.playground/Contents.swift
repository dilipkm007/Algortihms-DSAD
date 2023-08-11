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

/*
 
 
 
 Given two strings s and t, return true if t is an anagram of s, and false otherwise.

 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

  

 Example 1:

 Input: s = "anagram", t = "nagaram"
 Output: true
 Example 2:

 Input: s = "rat", t = "car"
 Output: false
  

 Constraints:

 1 <= s.length, t.length <= 5 * 104
 s and t consist of lowercase English letters.
  

 Follow up: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?
 
 */
func isAnagram(_ s: String, _ t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    var dict: [Character: Int] = [Character: Int]()
    for char in t {
        dict[char, default: 0] += 1
    }
    
    for char in s {
        if let count = dict[char], count > 0 {
            dict[char, default: 0] -= 1
        } else {
            return false
        }
    }
    
    for count in dict.values {
        if count > 0 {
            return false
        }
    }
    return true
}


print("========= Valid Anagram ======================= ")
print(isAnagram("anagram", "nagaram"))
print(isAnagram("rat", "car"))
print(isAnagram("aabb", "ba"))
print()


/*
 
 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

 Given a string s, return true if it is a palindrome, or false otherwise.

  

 Example 1:

 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome.
 Example 2:

 Input: s = "race a car"
 Output: false
 Explanation: "raceacar" is not a palindrome.
 Example 3:

 Input: s = " "
 Output: true
 Explanation: s is an empty string "" after removing non-alphanumeric characters.
 Since an empty string reads the same forward and backward, it is a palindrome.
  

 Constraints:

 1 <= s.length <= 2 * 105
 s consists only of printable ASCII characters.
 
 
 */

//My solution


func isPalindrome(_ s: String) -> Bool {
    var newString = s.lowercased()
    let exp = "[^a-z0-9]+"
    newString = newString.replacingOccurrences(of: exp, with: "", options: .regularExpression)
    var strArray = Array(newString)
    var i = 0
    var j = strArray.count - 1
    while i < j {
        if strArray[i] == strArray[j] {
            i += 1
            j -= 1
        } else {
            return false
        }
    }
        
    return true
}

print("========= Valid Palindrome ======================= ")
print(isPalindrome("A man, a plan, a canal: Panama"))
print(isPalindrome("race a car"))
print(isPalindrome(" "))
print()

//ChatGPT

func isPalindromeChatGPT(_ s: String) -> Bool {
    let sClean  = s.lowercased().filter { $0.isLetter || $0.isNumber }
    return sClean == String(sClean.reversed())
   
}

print("========= Valid isPalindromeChatGPT ======================= ")
print(isPalindromeChatGPT("A man, a plan, a canal: Panama"))
print(isPalindromeChatGPT("race a car"))
print(isPalindromeChatGPT(" "))
print()


/*
 
 Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer (similar to C/C++'s atoi function).

 The algorithm for myAtoi(string s) is as follows:

 Read in and ignore any leading whitespace.
 Check if the next character (if not already at the end of the string) is '-' or '+'. Read this character in if it is either. This determines if the final result is negative or positive respectively. Assume the result is positive if neither is present.
 Read in next the characters until the next non-digit character or the end of the input is reached. The rest of the string is ignored.
 Convert these digits into an integer (i.e. "123" -> 123, "0032" -> 32). If no digits were read, then the integer is 0. Change the sign as necessary (from step 2).
 If the integer is out of the 32-bit signed integer range [-231, 231 - 1], then clamp the integer so that it remains in the range. Specifically, integers less than -231 should be clamped to -231, and integers greater than 231 - 1 should be clamped to 231 - 1.
 Return the integer as the final result.
 Note:

 Only the space character ' ' is considered a whitespace character.
 Do not ignore any characters other than the leading whitespace or the rest of the string after the digits.
  

 Example 1:

 Input: s = "42"
 Output: 42
 Explanation: The underlined characters are what is read in, the caret is the current reader position.
 Step 1: "42" (no characters read because there is no leading whitespace)
          ^
 Step 2: "42" (no characters read because there is neither a '-' nor '+')
          ^
 Step 3: "42" ("42" is read in)
            ^
 The parsed integer is 42.
 Since 42 is in the range [-231, 231 - 1], the final result is 42.
 Example 2:

 Input: s = "   -42"
 Output: -42
 Explanation:
 Step 1: "   -42" (leading whitespace is read and ignored)
             ^
 Step 2: "   -42" ('-' is read, so the result should be negative)
              ^
 Step 3: "   -42" ("42" is read in)
                ^
 The parsed integer is -42.
 Since -42 is in the range [-231, 231 - 1], the final result is -42.
 Example 3:

 Input: s = "4193 with words"
 Output: 4193
 Explanation:
 Step 1: "4193 with words" (no characters read because there is no leading whitespace)
          ^
 Step 2: "4193 with words" (no characters read because there is neither a '-' nor '+')
          ^
 Step 3: "4193 with words" ("4193" is read in; reading stops because the next character is a non-digit)
              ^
 The parsed integer is 4193.
 Since 4193 is in the range [-231, 231 - 1], the final result is 4193.
  

 Constraints:

 0 <= s.length <= 200
 s consists of English letters (lower-case and upper-case), digits (0-9), ' ', '+', '-', and '.'.
 
 
 
 
 */


func myAtoi(_ s: String) -> Int {
       var str = s.trimmingCharacters(in: .whitespaces)
       var sign = 1
       var result = 0
       
       let INT_MAX =  Int(pow(Double(2), Double(31))) - 1
       let INT_MIN = -Int(pow(Double(2), Double(31)))
       
       if str.isEmpty {
           return 0
       }
       
       if str.first == "+" || str.first == "-" {
           sign = str.first == "-" ? -1 : 1
           str.removeFirst()
       }
       
       for char in str {
          if let digit = char.wholeNumberValue {
               if result > (INT_MAX - digit) / 10 {
                   return sign == 1 ? INT_MAX : INT_MIN
               }
               result = result * 10 + digit
           } else {
               break
           }
       }
       return result * sign
   }


print("========= String to Integer (atoi) ======================= ")
print(myAtoi("+-12"))
print(myAtoi("42"))
print(myAtoi("-42"))
print(myAtoi("4193 with words"))
print()



/*
 
 Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

  

 Example 1:

 Input: haystack = "sadbutsad", needle = "sad"
 Output: 0
 Explanation: "sad" occurs at index 0 and 6.
 The first occurrence is at index 0, so we return 0.
 Example 2:

 Input: haystack = "leetcode", needle = "leeto"
 Output: -1
 Explanation: "leeto" did not occur in "leetcode", so we return -1.
  

 Constraints:

 1 <= haystack.length, needle.length <= 104
 haystack and needle consist of only lowercase English characters.
 
 
 
 
 
 */

func strStr(_ haystack: String, _ needle: String) -> Int {
    guard needle.count > 0 && haystack.count >= needle.count else { return -1 }
    let needleChars = Array(needle)
    let haystackChars = Array(haystack)
    
    for i in  0..<haystackChars.count - needleChars.count + 1 {
        let startIndex = i
        let endIndex = startIndex + needleChars.count
        var isMatch = true
        for j in  0..<needleChars.count {
            if haystackChars[startIndex+j] != needleChars[j] {
                isMatch = false
                break
            }
        }
        if isMatch {
            return startIndex
        }
        
    }
    
    return -1
}


print("========= Implement strStr ======================= ")
print(strStr("sadbutsad", "sad"))
print(strStr("sadbutsad", "but"))
print(strStr("leetcode", "leeto"))
print(strStr("aa", "aabb"))

print()

/*
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".

  

 Example 1:

 Input: strs = ["flower","flow","flight"]
 Output: "fl"
 Example 2:

 Input: strs = ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
  

 Constraints:

 1 <= strs.length <= 200
 0 <= strs[i].length <= 200
 strs[i] consists of only lowercase English letters.
 
 
 */
//My solutiom
func longestCommonPrefix(_ strs: [String]) -> String {
      let firstStr = Array(strs[0])
      var maxMatch = firstStr.count
       for i in 1..<strs.count {
           var matchChar = 0
           var strArr = Array(strs[i])
           var j = 0
           while j < firstStr.count, j < strArr.count {
               if firstStr[j] == strArr[j] {
                   matchChar += 1
               } else {
                   break
               }
               j += 1
           }

           if matchChar < maxMatch {
               maxMatch = matchChar
           }
       }
       var matchStr = ""
       for i in 0..<maxMatch {
           matchStr += String(firstStr[i])
       }
       return matchStr
   }
print("=========   Longest Common Prefix ======================= ")
print(longestCommonPrefix(["flower","flow","flight"]))
print(longestCommonPrefix(["dog","racecar","car"]))
print(longestCommonPrefix(["dg","d","dilip"]))

print()


//Bing code


func longestCommonPrefix_v2(_ strs: [String]) -> String {
    // If the array is empty, return an empty string
    if strs.isEmpty {
        return ""
    }
    // If the array has only one element, return that element
    if strs.count == 1 {
        return strs[0]
    }
    // Sort the array in lexicographical order
    let sortedStrs = strs.sorted()
    // Initialize the prefix as the first element
    var prefix = sortedStrs[0]
    // Loop through the rest of the elements
    for i in 1..<sortedStrs.count {
        // While the prefix is not a prefix of the current element, remove the last character from the prefix
        while !sortedStrs[i].hasPrefix(prefix) && !prefix.isEmpty {
            prefix.removeLast()
        }
        // If the prefix becomes empty, break the loop
        if prefix.isEmpty {
            break
        }
    }
    // Return the prefix
    return prefix
}


print("=========   Longest Common Prefix ======================= ")
print(longestCommonPrefix_v2(["flower","flow","flight"]))
print(longestCommonPrefix_v2(["dog","racecar","car"]))
print(longestCommonPrefix_v2(["dg","d","dilip"]))

print()

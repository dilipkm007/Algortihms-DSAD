import UIKit

func reverseString(_ text: String) -> String{
    var array = Array(text)
    var index = 0
    let length = text.count
    while index < length / 2 {
        (array[index], array[length - index - 1]) =  (array[length - index - 1], array[index])
        index += 1
    }
    
    return String(array)
}

func reverseStringAnotherWay(_ text: String) -> String{
    var array = Array(text)
    var lower = 0
    var higher =  array.count - 1
    while lower < higher{
        (array[lower], array[higher]) = (array[higher], array[lower])
        lower += 1
        higher -= 1
    }
    return String(array)
}


print(reverseString("Dilipk"))
print(reverseStringAnotherWay("12345678"))
print(reverseStringAnotherWay("123456789"))

func toLowerCase(_ text: String) -> String {
    let arr = Array(text)
    let newaarr = arr
        .map { Int($0.unicodeScalars.first?.value ?? 0) }
        .map{
            if $0 >= 65 && $0 <= 90 {
                return Character(UnicodeScalar( $0 + 32) ?? " ")
            } else {
                return Character(UnicodeScalar( $0) ?? " ")
            }
     }
    return String(newaarr)
}

print(toLowerCase("DILIP123"))

func isValidParenthese(_ text: String) -> Bool {
    var stack = [String]()
    let dict: [String: String] = [ "(": ")", "{": "}", "[": "]"]
    var arr = Array(text)
    var index = 0
    while index < arr.count {
        if let ele = stack.last, dict[ele] == "\(arr[index])" {
            stack.removeLast()
        } else {
            stack.append("\(arr[index])")
        }
        index += 1
    }
    
    return stack.isEmpty
}

print(isValidParenthese("([{()}])"))

func decodeString(_ text: inout String, _ currentNumbers: inout [Int], _ currentStrings: inout [String], _ finalString:  inout String) -> String {
    if text.count == 0 {
        return finalString
    }
    if let numbervalue = text[text.startIndex].wholeNumberValue {
        currentNumbers.append(numbervalue)
        text = String(text.removeFirst())
        decodeString(&text, &currentNumbers, &currentStrings, &finalString)
    } else if text.first == "]" {
        let value = currentNumbers.popLast()
        let current = currentStrings.popLast()
        finalString += String(repeating: current ?? "", count: value ?? 0)
        text = String(text.removeFirst())
        decodeString(&text, &currentNumbers, &currentStrings, &finalString)
    } else if text.first == "[" {
        currentStrings = ""
    }
    
    return finalString
}

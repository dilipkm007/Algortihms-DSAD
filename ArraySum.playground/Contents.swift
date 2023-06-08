import UIKit

//func brustForce(_ mainArray: [Int]) -> [[Int]] {
//    var finalArray = [[Int]]()
//    for i in 0..<mainArray.count {
//        var arr = [Int]()
//        var sum = mainArray[i]
//        var j = i + 1
//        arr.append(mainArray[i])
//        while sum != 0 && j != mainArray.count {
//            sum += mainArray[j]
//            arr.append(mainArray[j])
//            j += 1
//        }
//
//        if sum == 0 {
//            finalArray.append(arr)
//        }
//    }
//    return finalArray
//}


func brustForce(_ mainArray: [Int]){
    for i in 0..<mainArray.count {
        var total = 0
        var array = [Int]()
        for j in i..<mainArray.count {
            total += mainArray[j]
            array.append(mainArray[j])
            if total == 0 {
                print(array)
            }
        }
    }
}


let array = [ 3, 4, -7, 3, 1, 3, 1, -4, -2, -2 ]
brustForce(array)

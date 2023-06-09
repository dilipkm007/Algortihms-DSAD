import UIKit

/*
 In array of size 2N(N>1) there are N+1 unique elements and exactly one of these elements is repeated N times
 write a program to find element repeated N times
 
 input X[] = [1, 2, 2, 3] Output:2
 input x[] = [2, 1, 2, 5, 3, 2, 2, 4] Output: 2
 input x[] = [5, 1, 5, 2, 5, 3, 5, 4, 5, 6] Output: 5

 */
func brustForceApproch(arr: [Int]) -> Int{
    var repeatedNum = arr[0]
    var dict = [Int: Int]()
    var i = 0
    while i < arr.count {
        dict[arr[i]] =  ( dict[arr[i]] ?? 0 ) + 1
        if ( dict[arr[i]] ?? 0) > 1 {
            repeatedNum = arr[i]
            break
        }
        i += 1
    }
    return repeatedNum
}

print("================== brustForceApproch ========================")

let a = [1, 2, 2, 3]
print("|| \(brustForceApproch(arr: a))                                                       ||")
let b = [2, 1, 2, 5, 3, 2, 2, 4]
print("|| \(brustForceApproch(arr: b))                                                       ||")
let c = [5, 1, 5, 2, 5, 3, 5, 4, 5, 6]
print("|| \(brustForceApproch(arr: c))                                                       ||")
let d = [0, 5, 1, 5, 2, 5, 3, 5, 4, 5, 6]
print("|| \(brustForceApproch(arr: d))                                                       ||")
let e = [1, 2, 3, 4, 6, 5, 5, 5, 5, 5]
print("|| \(brustForceApproch(arr: e))                                                       ||")

/*
 Pigeon Hole principle
 
 */
func pigeonHolePrinciple(arr: [Int]) -> Int{
    var repeatedNum = arr[0]

    for k in 1...3 {
        for i in 0..<arr.count-k {
            if arr[i] == arr[i+k] {
                return arr[i]
            }
        }
    }
    return repeatedNum
}
print("================ pigeonHolePrinciple ========================")
print("|| \(pigeonHolePrinciple(arr: a))                                                       ||")
print("|| \(pigeonHolePrinciple(arr: b))                                                       ||")
print("|| \(pigeonHolePrinciple(arr: c))                                                       ||")
print("|| \(pigeonHolePrinciple(arr: d))                                                       ||")
print("|| \(pigeonHolePrinciple(arr: e))                                                       ||")
print("======================= Done ================================")

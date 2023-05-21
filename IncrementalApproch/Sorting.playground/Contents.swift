import UIKit
//Bubble Sort
//Buble sort doing the swaping between two adjcent cells of array
//outerloop 0 to n-1
//inner loop 0 to n-i-1
//check if array[inner loop] > array[inner loop + 1] then swap

func bubbleSort(array: inout  [Int], increasingOrder: Bool){
    for i in 0..<array.count-1 {
        for j in 0..<array.count-i-1 {
            var needToSwap = false
            if increasingOrder {
                needToSwap = array[j] > array[j+1]
            } else {
                needToSwap = array[j] < array[j+1]
            }
            if(needToSwap) {
                (array[j], array[j+1]) = (array[j+1], array[j])
            }
        }
    }
}


func bubbleSortOptimize(array: inout  [Int], increasingOrder: Bool){
    for i in 0..<array.count-1 {
         var alreadySorted = true
        for j in 0..<array.count-i-1 {
            var needToSwap = false
            if increasingOrder {
                needToSwap = array[j] > array[j+1]
            } else {
                needToSwap = array[j] < array[j+1]
            }
            if(needToSwap) {
                alreadySorted = false
                (array[j], array[j+1]) = (array[j+1], array[j])
            }
        }
        if alreadySorted {
            print("Seems array allready soreted")
            break
        }
    }
}



func bubbleSortRec(array: inout  [Int], sizeOfArry: Int , increasingOrder: Bool) -> [Int]{
    if sizeOfArry == 1 {
        return array
    }
        for j in 0..<array.count-1 {
            var needToSwap = false
            if increasingOrder {
                needToSwap = array[j] > array[j+1]
            } else {
                needToSwap = array[j] < array[j+1]
            }
            if(needToSwap) {
                (array[j], array[j+1]) = (array[j+1], array[j])
            }
        }
    return bubbleSortRec(array: &array, sizeOfArry: sizeOfArry-1, increasingOrder: increasingOrder)
    }



func bubbleSortString(name: String, increasingOrder: Bool) -> String{
    var array = Array(name)
    for i in 0..<array.count-1 {
        for j in 0..<array.count-i-1 {
            var needToSwap = false
            if increasingOrder {
                needToSwap = array[j] > array[j+1]
            } else {
                needToSwap = array[j] < array[j+1]
            }
            if(needToSwap) {
                (array[j], array[j+1]) = (array[j+1], array[j])
            }
        }
    }
    return String(array)
}


//var array = [5, 6, 9, 2, 4, 5, 1]
//bubbleSort(array: &array, increasingOrder: false)
//print(array)
//
//var array1 = [10, 1, 2, 3, 4, 5, 6]
//bubbleSortOptimize(array: &array1, increasingOrder: true)
//print(array1)
//
//
//var array2 = [5, 6, 9, 2, 4, 5, 1]
//bubbleSortRec(array: &array2, sizeOfArry: array2.count, increasingOrder: false)
//print(array2)
//
//
//print(bubbleSortString(name: "dilip", increasingOrder: false))




//Selection Sort
//Selection sort first find smallest element of array and than swap it with first element of array, then secon smallest and swap with second element of array
//outerloop 0 to n-1
//inner loop i to n-1
//we use one variable to track minIndex

func selectionSorting(array: inout [Int], isAccendingorder: Bool) {
    for i in 0..<array.count-1 {
        var minindex = i
        for j in i..<array.count {
            var isMinMaxIndex = false
            if isAccendingorder {
                isMinMaxIndex = array[j] < array[minindex]
            } else {
                isMinMaxIndex = array[j] > array[minindex]
            }
            if isMinMaxIndex {
                minindex = j
            }
        }
        if minindex != i {
            (array[minindex], array[i]) = (array[i], array[minindex])
        }
    }
}


func selectionSortingRecursive(array: inout [Int], i: Int, n: Int, isAccendingorder: Bool) {
    if n <= 1 {
        return
    }
        var minindex = i
        for j in i..<array.count {
            var isMinMaxIndex = false
            if isAccendingorder {
                isMinMaxIndex = array[j] < array[minindex]
            } else {
                isMinMaxIndex = array[j] > array[minindex]
            }
            if isMinMaxIndex {
                minindex = j
            }
        }
      (array[minindex], array[i]) = (array[i], array[minindex])
       selectionSortingRecursive(array: &array, i: i+1, n: n-1, isAccendingorder: isAccendingorder)
}


//var array = [5, 6, 9, 2, 4, 5, 1]
//selectionSorting(array: &array, isAccendingorder: true)
//print(array)
//
//var array1 = [5, 6, 9, 2, 4, 5, 1]
//selectionSorting(array: &array1, isAccendingorder: false)
//print(array1)
//
//var array2 = [5, 6, 9, 2, 4, 5, 1]
//selectionSortingRecursive(array: &array2, i: 0, n: array2.count, isAccendingorder: true)
//print(array2)
//
//var array3 = [5, 6, 9, 2, 4, 5, 1]
//selectionSortingRecursive(array: &array3, i: 0, n: array3.count, isAccendingorder: false)
//print(array3)


func selectionSort(array: inout [Int], isAccendingorder: Bool) {
    let n = array.count
    for i in 0..<n {
        let currVal = array[i]
        var j = i - 1
        while j >= 0 && ((isAccendingorder && array[j] > currVal) || (!isAccendingorder && array[j] < currVal)) {
            array[j+1] = array[j]
            j = j - 1
        }
        array[j+1] = currVal
    }
}

//var array = [2,1,0]
//selectionSorting(array: &array, isAccendingorder: true)
//print(array)
//
//
//selectionSorting(array: &array, isAccendingorder: false)
//print(array)
//


//0,1,2 or dutch flag proble
//input [2,1,0,0,1,2,1,0] output: [0,0,0,1,1,1,2,2]
//O(n^2) using any sorting technique Bubble, selection inseartion
//O(n) we will go with counting apprroch

func dutchFlagProblem(array: inout [Int]) {
    var numberOf0s = 0
    var numberOf1s = 0
    var numberOf2s = 0
    for i in 0..<array.count {
        if array[i] == 0 {
            numberOf0s += 1
        } else if array[i] == 1 {
            numberOf1s += 1
        } else {
            numberOf2s += 1
        }
    }
     var i = 0
    while numberOf0s != 0 {
        array[i] = 0
        numberOf0s -= 1
        i = i + 1
    }
    
    while numberOf1s != 0 {
        array[i] = 1
        numberOf1s -= 1
        i = i + 1
    }
    while numberOf2s != 0 {
        array[i] = 2
        numberOf2s -= 1
        i = i + 1
    }
    
}


//var array = [0,0,0,0,0,0,0,0,0,0]
//dutchFlagProblem(array: &array)
//print(array)


func dutchFlagProblemOptimized(array: inout [Int]) {
    var mid = 0
    var low = 0
    var high = array.count - 1
    while low <= high {
        if array[mid] == 0 {
            (array[mid], array[low]) = (array[low], array[mid])
            mid += 1
            low += 1
        } else if array[mid] == 1 {
            mid += 1
        } else {
            (array[mid], array[high]) = (array[high], array[mid])
            high -= 1
        }
    }
}
var array = [1, 2, 0, 0, 2, 1, 1, 1, 0, 0, 2, 2, 0]
dutchFlagProblem(array: &array)
print(array)

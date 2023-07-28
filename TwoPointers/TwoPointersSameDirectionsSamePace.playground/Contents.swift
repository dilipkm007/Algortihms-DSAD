import UIKit

/*
 Merge sort is a popular sorting algorithm that uses the divide and conquers approch to sort an array
 complexity: O(nlogn)
 using: recursion
 
 Two Pointers Approch: The two pointer approch help us optimize time and space complexity in case of many searching problem on Array and Linkedlist.
 */
/*
 Dividing the problem into more than one subproblems, solving each of them and then if necessary, combining their solutions to get
 a solution to the original problem
 //Merge sort Quick sort Median of two sorted array
 */

/*
 Merge sort:
 It used divide and conquers approch to sort an array or linkedlist of integers characters/strings
 1. Fastest sorting algorithm O(nlogn) time complexity
 2. Best algorithm for sorting linked lists in O(nlogn) time.
 3. Best algo to learn Recursion
 4. Also good algorith for moving two pointers in same directions
 */

/*
 
 input: [6, 5, 3, 1, 8, 7, 2, 4] Output: [1, 2, 3, 4, 5, 6, 7, 8]
 Divide Part: (Divide problem in two equals parts)
 
 [6, 5, 3, 1] [8, 7, 2, 4]
 
 Conquer Part: [1, 3, 5, 6] [2, 4, 7, 8]
                    \           /
 combine Part: [1, 2, 3, 4, 5, 6, 7, 8]
 
 */

func mergeSortD(_ A: [Int], _ left: Int, _ right: Int) {
    if left >= right {
        return
    }
    
    var mid: Int = left + (right - left )/2
    mergeSortD(A, left, mid)
    mergeSortD(A, mid+1, right)

}

func mergeIt(_ A: [Int], left: Int, mid: Int, right: Int) {
    let n1: Int = mid - left - 1
    let n2:Int =  right - mid
    var x = Array(repeating: 0, count: n1)
    var Ys = Array(repeating: 0, count: n1)
    
    

    
}

mergeSortD([6, 5, 3, 1, 8, 7, 2, 4], 0, 7)

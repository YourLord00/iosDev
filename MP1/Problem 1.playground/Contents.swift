import UIKit

//MARK: Question 1, Concatenating Two Integers

/* Create a function to concatenate two integer arrays.
 concatenate([1, 3, 5], [2, 6, 8]) ➞ [1, 3, 5, 2, 6, 8]

 concatenate([7, 8], [10, 9, 1, 1, 2]) ➞ [7, 8, 10, 9, 1, 1, 2]

 concatenate([4, 5, 1], [3, 3, 3, 3, 3]) ➞ [4, 5, 1, 3, 3, 3, 3, 3]
 
 Do not forget to return the resulting array.
 
 Borrowed from: edabit.com
 */

//Calling the function
// let concatenatedArray = concatenate(array1:[...], array2:[...])
// print(concatenatedArray)

func concatenate(arr1:[Int], arr2:[Int]) -> [Int] {
    var largeArr:[Int]
    var smallArr:[Int]
    
    if(arr1.count > arr2.count) {
        largeArr = arr1
        smallArr = arr2
    } else {
        smallArr = arr1
        largeArr = arr2
    }
    var result:[Int] = []
    
    for i in (0..<largeArr.count) {
        if(i < smallArr.count) {
            result.append(smallArr[i] + largeArr[i])
        } else {
            result.append(largeArr[i])
        }
    }
    return result
}

let concatenatedArray1 = concatenate(arr1: [1,2,3], arr2: [1])
print(concatenatedArray1)

let concatenatedArray2 = concatenate(arr1: [1,2,3], arr2: [1,2,3])
print(concatenatedArray2)

let concatenatedArray3 = concatenate(arr1: [1], arr2: [1,2,3])
print(concatenatedArray3)
#imageLiteral(resourceName: "Screenshot 2023-09-13 at 11.34.32 PM.png")

import UIKit

//MARK: Question 3, Find the Largest Numbers in a Group of Arrays

/*
 Create a function that takes an array of arrays with numbers. Return a new (single) array with the largest numbers of each.

 findLargest([[4, 2, 7, 1], [20, 70, 40, 90], [1, 2, 0]]) ➞ [7, 90, 2]

 findLargest([[-34, -54, -74], [-32, -2, -65], [-54, 7, -43]]) ➞ [-34, -2, 7]

 findLargest([[0.4321, 0.7634, 0.652], [1.324, 9.32, 2.5423, 6.4314], [9, 3, 6, 3], [1, 2, 3, 4]]) ➞ [0.7634, 9.32, 9, 4]
 
 It is OK, if your returning array is [Double]
 
 Borrowed from: edabit.com
 */

//Calling the function
// let arrayOfLargests = findLargest(...)
// print(arrayOfLargests)
func findLargest(_ input:[[Double]]) -> [Double] {
    var outPut = [Double]()
    for item in input{
        var max = -Double.greatestFiniteMagnitude
        item.forEach { element in item
            if(element > max) {
                max = Double(element)
            }
        }
        outPut.append(max)
    }
    return outPut
}

print(findLargest([[4, 2, 7, 1], [20, 70, 40, 90], [1, 2, 0]]))
//      ➞ [7, 90, 2]

print(findLargest([[-34, -54, -74], [-32, -2, -65], [-54, 7, -43]]))
//      ➞ [-34, -2, 7])

print(findLargest([[0.4321, 0.7634, 0.652], [1.324, 9.32, 2.5423, 6.4314], [9, 3, 6, 3], [1, 2, 3, 4]]))
//      ➞ [0.7634, 9.32, 9, 4])

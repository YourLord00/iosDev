import UIKit

//MARK: Question 2, Sort and Array by String length

/* Create a function that takes an array of strings and return an array, sorted from shortest to longest.
 
 sortByLength(["Google", "Apple", "Microsoft"])
 ➞ ["Apple", "Google", "Microsoft"]

 sortByLength(["Leonardo", "Michelangelo", "Raphael", "Donatello"])
 ➞ ["Raphael", "Leonardo", "Donatello", "Michelangelo"]

 sortByLength(["Turing", "Einstein", "Jung"])
 ➞ ["Jung", "Turing", "Einstein"]
 
 Borrowed from: edabit.com
 */
       

//Calling the function
// let sortedArray = sortByLength(...)
// print(sortedArray)


func sortByLength(_ arrString:[String]) -> [String]{
    let res =  arrString.sorted(by: {(value1:String, value2:String) -> Bool in
         return value1.count < value2.count
    })
    return res
}

var testcase1 = sortByLength(["Google", "Apple", "Microsoft"])
print(testcase1)

var testcase2 = sortByLength(["Leonardo", "Michelangelo", "Raphael", "Donatello"])
print(testcase2)

var testcase3 = sortByLength(["Turing", "Einstein", "Jung"])
print(testcase3)

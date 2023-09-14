import UIKit

//MARK: Question 4, Remove the First and Last Characters

/*
 Create a function that removes the first and last characters from a string.
 
 removeFirstLast("hello") ➞ "ell"

 removeFirstLast("maybe") ➞ "ayb"

 removeFirstLast("benefit") ➞ "enefi"

 removeFirstLast("a") ➞ "a"
 
 Borrowed from: edabit.com
 
 HINT: remove(at: index)
 */

//Calling the function
// let removedFirstAndLast = removeFirstLast(...)
// print(removedFirstAndLast)

func removeFirstLast(_ string:String) -> String {
    var len = string.count
    if(len < 3) {
        return string
    }
    var newString = ""
    for i in 0..<len {
        if i == 0 || i == len - 1{
            continue
        }
        
        newString += String(string[string.index(string.startIndex, offsetBy: i)])
        
    }
    return newString
}


print(removeFirstLast("hello"))
//➞ "ell"

print(removeFirstLast("maybe"))
//➞ "ayb"

print(removeFirstLast("benefit"))
//➞ "enefi"

print(removeFirstLast("a"))
//➞ "a"

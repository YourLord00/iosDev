import UIKit

//MARK: Question 6, Divide and conquer
/*
 First, create a function that returns the number of times an integer can be divided by another integer without a remainder. The function should return nil if the division doesn’t produce a whole number. Name the function divideIfWhole.

 Then, write code that tries to unwrap the optional result of the function. There should be two cases: upon success, print "Yep, it divides \(answer) times", and upon failure, print "Not divisible :[".

 Finally, test your function:
 
 Call divideIfWhole(10, by: 2) -> 5. Since, the returned value is not nil, print: "Yep, it divides 5 times."
 divideIfWhole(10, by: 3) -> nil. Since, the returned value is nil, print: "Not divisible :[."
 
 
 
 borrowed from: https://www.kodeco.com/
 */
func divideIfWhole(_ target:Int, by:Int) ->Int? {
    var answer:Int?
    
    if target % by == 0 {
        answer = target / by
        if let answer = answer {
            print("Yep, it divides \(answer) times")
        }
    } else {
        print("Not divisible :[")
    }
    return answer
}

print(divideIfWhole(10, by: 2))
//      -> 5)

print(divideIfWhole(10, by: 3))
//      -> 5)

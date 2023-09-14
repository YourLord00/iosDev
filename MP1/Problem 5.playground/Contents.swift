import UIKit

//MARK: Question 5, Four Passengers and a Driver

/*
 A typical car can hold four passengers and one driver, allowing five people to travel around. Given n number of people, return how many cars are needed to seat everyone comfortably.

 carsNeeded(5) ➞ 1

 carsNeeded(11) ➞ 3

 carsNeeded(0) ➞ 0
 
 Borrowed from: edabit.com
 */

//Calling the function
// let numberOfCars = carsNeeded(...)
// print(numberOfCars)

func carsNeeded(_ totalNumber:Int) -> Int {
    if totalNumber == 0 {
        return 0
    }
    return (totalNumber + 4) / 5
    
}
print(carsNeeded(5))
//➞ 1

print(carsNeeded(11))
//➞ 3

print(carsNeeded(0))
//➞ 0

import UIKit

/*
 The is a car with a certain number of seats that only drives forward in a single road 1000km long.
 
 You are given the capacity of the car and an array of trips in which each trip has:
 - The number of passengers
 - The pick-up location
 - The drop-off location
 
 Example: given the trip [2,1,5], it means that 2 passengers will be picked up at 1st km and dropped off at 5th.
 
 Write a function that answers whether this car is able to comply with all the given trips.
 
 
 OUTPUTS EXAMPLES:
 
 [[2, 3, 6], [1,2,3]], 4 -> true
 [[2, 3, 6], [1,2,4]], 2 -> false
 [[2, 3, 6]], 2 -> true
 [[2, 3, 6]], 0 -> false
 
 km : capacity
 
 */

func canFinishTrips(_ trips: [[Int]], capacity: Int) -> Bool {
    
    guard capacity > 0 else { return false }
    
    var passengersOnBoard = 0
    var currentLocation = 0
    var kilometers: [Int] = [Int](repeating: 0, count: 1000)
    
    for trip in trips {
        
        let joined = trip[0]
        let pickup = trip[1]
        let dropoff = trip[2]
        
        kilometers[pickup] += joined
        kilometers[dropoff] -= joined
    }
    
    var currentCapacity = capacity
    
    for kilometer in kilometers {
        currentCapacity -= kilometer
        
        if currentCapacity < 0 {
            return false
        }
    }
    
    print(kilometers)
    
    return true
}

canFinishTrips([[2,3,6], [1,2,3]], capacity: 4)
canFinishTrips([[2, 3, 6], [1,2,4]], capacity: 2)


canFinishTrips([[2,1,2], [3,1,2]], capacity: 4)

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

//canFinishTrips([[2,3,6], [1,2,3]], capacity: 4)
//canFinishTrips([[2, 3, 6], [1,2,4]], capacity: 2)
//canFinishTrips([[2,1,2], [3,1,2]], capacity: 4)

// ------------------------------------------------

/*
 Dado um array, encontre o elemento que mais se repete.
 Se múltiplos elementos aparecem igualmente, retorne qualquer um deles.
 */

func getTheMostAppearedElement(from array: [Int]) -> Int {
    
    var countDict: [Int: Int] = [:]
    
    for element in array {
        countDict[element, default: 0] += 1
    }
    
    var mostAppeardElement: Int = -1
    
    for (element, appearences) in countDict {
        
        if appearences > mostAppeardElement {
            mostAppeardElement = element
        }
    }
    
    return mostAppeardElement
}

getTheMostAppearedElement(from: [1,1,1,2,2,2,2,2,2,3,4]) // 2
getTheMostAppearedElement(from: [1,2,2,1,10,10,10]) // 10


// -----------------------

import Foundation

public typealias Callback = (_ notification: String, _ data: Any) -> Void

public protocol Observer: AnyObject {
    var callback: Callback { get }
}

public protocol NotificationCenter {
    func add(observer: Observer, for notification: String)
    func remove(observer: Observer, for notification: String)
    func post(notification: String, data: Any)
}

public final class NotificationCenterImpl: NotificationCenter {
    
    var notifications: [String: [Observer]] = [:]
    
    public func add(observer: Observer, for notification: String) {
        // add observer to notification center for notifcation
        
        var alreadyAddedObservers = notifications[notification] ?? []
        alreadyAddedObservers.append(observer)
        
        notifications[notification] = alreadyAddedObservers
        
        //    print(notifications[notification])
    }
    
    public func remove(observer: Observer, for notification: String) {
        notifications[notification] = []
    }
    
    public func post(notification: String, data: Any) {
        // call the callback on the observers that match the notification
        
        let observers = notifications[notification]
        
        observers?.forEach { observer in
            observer.callback(notification, data)
        }
    }
}

class Sample: Observer {
    
    var callback: Callback = { notification, data in
        print("Did Appear")
    }
}

let notificationCenter = NotificationCenterImpl()

let sample = Sample()
notificationCenter.add(observer: sample, for: "keyboardDidAppear")
notificationCenter.add(observer: sample, for: "keyboardDidAppear")

notificationCenter.post(notification: "keyboardDidAppear", data: Data())

notificationCenter.remove(observer: sample, for: "keyboardDidAppear")

notificationCenter.post(notification: "keyboardDidAppear", data: Data())

// add an observer for keyboardDidAppear
// post keyboardDidAppear -> call the callback for all observers listening to keyboardDidAppear

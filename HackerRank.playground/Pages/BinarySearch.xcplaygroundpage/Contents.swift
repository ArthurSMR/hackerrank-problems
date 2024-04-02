import UIKit

func binarySearch(atArray array: [Int], value: Int) -> Int? {
    
    if array.count == 1 {
        return array[0] == value ? 0 : nil
    }
    
    var left: Int = 0
    var right: Int = array.count - 1
    
    while left <= right {
        let middleIndex = (left + right) / 2
        let middleValue = array[middleIndex]
        
        if middleValue > value {
            right = middleIndex - 1
        }
        
        else if middleValue < value {
            left = middleIndex + 1
        }
        
        else if middleValue == value {
            return middleIndex
        }
    }
    
    return nil
}

binarySearch(atArray: [1,3,5,7,15,20,73], value: 3)
binarySearch(atArray: [1,3,5,7,15,20,73], value: 73)
binarySearch(atArray: [1,3,5,7,15,20,73], value: 75)

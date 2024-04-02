import UIKit

// https://leetcode.com/problems/search-insert-position/description/

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    
    var leftIndex = 0
    var rightIndex = nums.count - 1
    
    while leftIndex <= rightIndex {
        print(leftIndex)
        print(rightIndex)
        let middleIndex = leftIndex + (rightIndex - leftIndex) / 2
        let middleValue = nums[middleIndex]
        
        if target < middleValue {
            rightIndex = middleIndex - 1
        } else if target > middleValue {
            leftIndex = middleIndex + 1
        } else {
            return middleIndex
        }
    }
    return leftIndex
}

// You must write an algorithm with O(log n) runtime complexity.

var example1 = [1,3,5,6]
var target1 = 5
print(searchInsert(example1, target1)) // Output = 2

var example2 = [1,3,5,6]
var target2 = 2
print(searchInsert(example2, target2)) // Output = 1

var example3 = [1,3,5,6]
var target3 = 7
print(searchInsert(example3, target3)) // Output = 4

import UIKit

// https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/description/

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    
    // [5,7,7,8,8,10]
    
    var left: Int = 0
    var right: Int = nums.count - 1
    var startingPosition: Int = -1
    var endingPosition: Int = -1
    var range: [Int]
    
    while left <= right {
        
        let mid = (left + right) / 2
        
        if nums[mid] == target {

            if startingPosition == -1 {
                startingPosition = mid
            } else {
                endingPosition = mid - 1
            }
            
            left = mid + 1
        } else if target > nums[mid] {
            left = mid + 1
        } else if target < nums[mid] {
            right = mid - 1
        }
    }
    
    range = [startingPosition, endingPosition]
    
    return range
}

searchRange([5,7,8,8,8,8,8,8,10], 8)

import UIKit

// https://leetcode.com/problems/search-in-rotated-sorted-array/

func search(_ nums: [Int], _ target: Int) -> Int {
    
    guard !nums.isEmpty else { return -1 }
    
    var left: Int = 0
    var right: Int = nums.count - 1
    
    while left <= right {
        
        let middleIndex = (left + right) / 2
        
        if target == nums[middleIndex] { return middleIndex }
        
        if nums[left] <= nums[middleIndex] {
            // Left half
            if target >= nums[left] && target <= nums[middleIndex] {
                right = middleIndex - 1
            } else {
                left = middleIndex + 1
            }
        } else {
            // right half
            if target >= nums[middleIndex] && target <= nums[right] {
                left = middleIndex + 1
            } else {
                right = middleIndex - 1
            }
        }
    }
    return -1
}

search([4,5,6,7,0,1,2], 0)

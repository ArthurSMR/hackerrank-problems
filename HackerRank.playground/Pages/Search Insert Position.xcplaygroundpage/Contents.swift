import UIKit

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    for i in 0..<nums.count {
        if nums[i] == target || nums[i] > target {
            return i
        }
    }
    return nums.count
}

/*
 Input: nums = [1,3,5,6], target = 5
 Output: 2
 */

searchInsert([1,3,5,6], 5)
searchInsert([1,3,5,6], 7)
searchInsert([1,3,5,6], 2)

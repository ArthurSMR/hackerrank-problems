import UIKit

/*
 https://leetcode.com/problems/find-pivot-index/?envType=study-plan&id=level-1
 */

func pivotIndex(_ nums: [Int]) -> Int {
    
    let allSum = nums.reduce(0, +)
    var leftSum = 0
    
    for i in 0..<nums.count {
        let rightSum = allSum - leftSum - nums[i]
        
        if leftSum == rightSum {
            return i
        }
        
        leftSum += nums[i]
    }
    return -1
}

pivotIndex([1,7,3,6,5,6])
pivotIndex([2,1,-1])

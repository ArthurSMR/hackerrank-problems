import UIKit

// https://leetcode.com/problems/longest-consecutive-sequence/

func longestConsecutive(_ nums: [Int]) -> Int {
    
    guard !nums.isEmpty, nums.count <= 100000 else { return 0 }
        
    let sortedNums = nums.sorted()
    
    var longestConsecutiveCount = 1
    var supportCount = 1
    
    for (index, sortedNum) in sortedNums.enumerated() {
        
        guard index + 1 < sortedNums.count else { break }
        
        let nextNumber = sortedNums[index + 1]
        
        if nextNumber == sortedNum + 1 {
            supportCount += 1
        } else if nextNumber == sortedNum {
            continue
        } else {
            supportCount = 1
        }
        
        if supportCount > longestConsecutiveCount {
            longestConsecutiveCount = supportCount
        }
    }
    
    return longestConsecutiveCount
}


longestConsecutive([100,4,200,1,3,2])
longestConsecutive([0,3,7,2,5,8,4,6,0,1])
longestConsecutive([1,2,0,1])

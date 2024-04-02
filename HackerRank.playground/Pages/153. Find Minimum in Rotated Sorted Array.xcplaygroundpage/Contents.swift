import UIKit

// https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/description/

func findMin(_ nums: [Int]) -> Int {
    
    guard !nums.isEmpty,
          nums.count <= 5000 else { return -1 }
    
    var array = nums
    var left: Int = 0
    var right: Int = nums.count - 1
    
    while left <= right {
        if array[left] > array[right] {
            array.insert(array[right], at: 0)
            array.removeLast()
            left += 1
        } else {
            break
        }
    }
    
    return array.first ?? -1
}

findMin([3,4,5,1,2])
findMin([11,13,15,17])

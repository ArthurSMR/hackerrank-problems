import UIKit

/*
 https://leetcode.com/problems/running-sum-of-1d-array/?envType=study-plan&id=level-1
 */

func runningSum(_ nums: [Int]) -> [Int] {
    
    var auxSum = 0
    var runningSum: [Int] = []
    
    for num in nums {
        auxSum += num
        runningSum.append(auxSum)
    }
    
    return runningSum
}

runningSum([1,2,3,4])

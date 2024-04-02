import UIKit

// https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/description/

class Solution {
    
    private func binaryToHours(hours: Int, minutes: Int) -> String {
        return "\(hours):\(minutes)"
    }
    
    func readBinaryWatch(_ turnedOn: Int) -> [String] {
        let minutes: [Int] = [1, 2, 4, 8, 16, 32]
        let hours: [Int] = [1, 2, 4, 8]
        
        var possibleTimes: [String] = []
        var shouldContinue: Bool = true
        
        while shouldContinue {
            
            for minute in minutes {
                
            }
        }
        
        return possibleTimes
    }
}

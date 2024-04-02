import UIKit

/*
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
 */

func maxProfit(_ prices: [Int]) -> Int {
    
    guard !prices.isEmpty else { return 0 }
    
    var lowestValue: Int = Int.max
    var lowestDay: Int = 0
    
    var highestValue: Int = 0
    
    for day in 0..<prices.count {
        
        if prices[day] < lowestValue {
            lowestValue = prices[day]
            lowestDay = day
        }
        
        if prices[day] > highestValue && day > lowestDay {
            highestValue = prices[day]
        }
    }
    
    guard highestValue > lowestValue else { return 0 }
    
    var maximumProfit = highestValue - lowestValue
    
    return maximumProfit
}

maxProfit([7,1,5,3,6,4]) // 5
maxProfit([7,6,4,3,1]) // 0

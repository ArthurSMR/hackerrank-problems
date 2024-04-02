import UIKit

// https://leetcode.com/problems/longest-common-prefix/

func longestCommonPrefix(_ strs: [String]) -> String {
    
    guard strs.count <= 200 else { return "" }
    
    var commonPrefix: String = strs[0]
    
    for ch in strs {
        while !ch.hasPrefix(commonPrefix) {
            commonPrefix = String(commonPrefix.dropLast())
            print(commonPrefix)
        }
    }
        
    return commonPrefix
}

longestCommonPrefix(["flower", "flow", "flight"])

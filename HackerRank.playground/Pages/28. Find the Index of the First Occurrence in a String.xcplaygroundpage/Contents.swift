import UIKit

// https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/

func strStr(_ haystack: String, _ needle: String) -> Int {
    
    guard !haystack.isEmpty, !needle.isEmpty else {
        return -1
    }
    
    let limit: Int = 10_000
    
    guard haystack.count <= limit, needle.count <= limit else {
        return -1
    }
    
    let haystackCount = haystack.count
    let needleCount = needle.count
    
    for i in 0...(haystackCount - needleCount) {
        let start = haystack.index(haystack.startIndex, offsetBy: i)
        let end = haystack.index(start, offsetBy: needleCount)
        if haystack[start..<end] == needle {
            return i
        }
    }
    
    return -1
}

strStr("sadbutsad", "sad") // output: 0
strStr("leetcode", "leeto") // output: -1

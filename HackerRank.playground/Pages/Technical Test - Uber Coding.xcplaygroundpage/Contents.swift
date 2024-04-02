import Foundation

/*
 
 Most Popular Problems for Uber (last 6 months):

 Bus Routes (40 times): https://leetcode.com/problems/bus-routes/

 Find the Closest Palindrome (19 times): https://leetcode.com/problems/find-the-closest-palindrome/

 Longest Continuous Subarray With Absolute Diff Less Than or Equal to Limit (15 times): https://leetcode.com/problems/longest-continuous-subarray-with-absolute-diff-less-than-or-equal-to-limit/

 Leftmost Column with at Least a One (15 times): https://leetcode.com/problems/leftmost-column-with-at-least-a-one/

 Merge Intervals (13 times): https://leetcode.com/problems/merge-intervals/

 Kth Smallest Element in a BST (12 times): https://leetcode.com/problems/kth-smallest-element-in-a-bst/

 Number of Islands (12 times): https://leetcode.com/problems/number-of-islands/

 Word Search II (12 times): https://leetcode.com/problems/word-search-ii/

 Evaluate Division (12 times): https://leetcode.com/problems/evaluate-division/

 Word Search (11 times): https://leetcode.com/problems/word-search/

 Construct Quad Tree (10 times): https://leetcode.com/problems/construct-quad-tree/

 Longest Repeating Character Replacement (10 times): https://leetcode.com/problems/longest-repeating-character-replacement/

 Top K Frequent Words (10 times): https://leetcode.com/problems/top-k-frequent-words/

 Two Sum (9 times): https://leetcode.com/problems/two-sum/

 Insert Delete GetRandom O(1) (8 times): https://leetcode.com/problems/insert-delete-getrandom-o1/

 Text Justification (8 times): https://leetcode.com/problems/text-justification/

 Bomb Enemy (7 times): https://leetcode.com/problems/bomb-enemy/

 Burst Balloons (7 times): https://leetcode.com/problems/burst-balloons/

 Minimum Time to Complete Trips (7 times): https://leetcode.com/problems/minimum-time-to-complete-trips/

 Longest Substring Without Repeating Characters (7 times): https://leetcode.com/problems/longest-substring-without-repeating-characters/
 
 */

open class UberCodingTests {
    
    // MARK: - 56. Merge Intervals
    func mergeIntervals() {
        
        let intervals = [[1,4], [2,6], [5, 10]]
        let merged = merge(intervals)
        print(merged)
    }
    
    private func merge(_ intervals: [[Int]]) -> [[Int]] {
        
        if intervals.isEmpty { return [] }
        
        var sorted = intervals.sorted { $0[0] < $1[0] }
        
        var results = [sorted[0]]
        
        for i in 1..<sorted.count {
            
            guard let lastResult = results.last else { return [] }
            
            let prevStart = lastResult[0]
            let prevEnd = lastResult[1]
            
            let currentStart = sorted[i][0]
            let currentEnd = sorted[i][1]
            
            if prevEnd >= currentStart && prevEnd < currentEnd {
                results.removeLast()
                results.append([prevStart, currentEnd])
            } else if prevEnd < currentStart {
                results.append([currentStart, currentEnd])
            }
        }
        
        return results
    }
    
    // MARK: - 564. Find the Closest Palindrome
    
    func nearestPalindromic() {
        print(nearestPalindromic("1098503901"))
    }
    
    /// NOT EFFICIENT
    private func nearestPalindromic(_ n: String) -> String {
        
        /*
         Negative numbers?
         "10" -> "9"
         "11" -> "9"
         "16" -> "11"
         "100" -> "99"
         */
        
        guard let num = Int(n) else { return "" }
        
        var prevNum = num - 1
        var nextNum = num + 1
        
        var foundPalindrome: Bool = false
        
        while !foundPalindrome {
            
            if isPalindrome(number: prevNum) {
                return String(prevNum)
            } else if isPalindrome(number: nextNum) {
                return String(nextNum)
            }
            
            prevNum -= 1
            nextNum += 1
        }
    }
    
    private func isPalindrome(number: Int) -> Bool {
        let numberAsString = String(number)
        return numberAsString.reversed() == Array(numberAsString)
    }
    
    // MARK: - 3. Longest Substring Without Repeating Characters
    
    func lengthOfLongestSubstring() {
        print(lengthOfLongestSubstring("pwwkew"))
    }
    
    private func lengthOfLongestSubstring(_ s: String) -> Int {
        
        /*
         abcabcbb -> 3 "abc"
         bbbbb -> 1 "b"
         pwwkew -> 3 "wke"
         abcdefgg -> 7 "abcdefg"
         a -> 1 // OK
         abbcd
         */
        
        if s.count == 1 { return 1 }
        
        guard s.count >= 0, s.count <= 50000 else { return 0 }
        
        let sArray = Array(s)
        var longestSubstring: String = ""
        
        for (index, currentChar) in sArray.enumerated() {
            
            var substringCandidate: [Character] = [currentChar]
            var nextIndex = index + 1
            
            while nextIndex < sArray.count {
                
                let nextChar = sArray[nextIndex]
                
                if !substringCandidate.contains(nextChar) {
                    substringCandidate.append(nextChar)
                } else {
                    break
                }
                
                nextIndex += 1
            }
            
            if substringCandidate.count > longestSubstring.count {
                longestSubstring = String(substringCandidate)
            }
        }
        
        return longestSubstring.count
    }
    
    // MARK: - 815 Bus Routes
    
    func numBusesToDestination() {
        let routes = [[1,2,7],[3,6,7]]
        let source = 1
        let target = 6
        
//        let routes = [[1,2,7],[3,6,7], [6,10,13]]
//        let source = 1
//        let target = 13
        
        print(numBusesToDestination(routes, source, target))
    }
    
    /*
     Test Cases:
     
     [[1,2,3], [4,5,6]], source = 1, target = 4
     output: -1
     
     [[1,2,7],[3,6,7]], source = 1, target = 6
     output: 2
     
     [[1,2,7],[3,6,7],[6,10,13]], source = 1, target = 13
     output: 3
     */
    
    private func numBusesToDestination(_ routes: [[Int]], _ S: Int, _ T: Int) -> Int {
        
        var routesOf: [Int: [Int]] = [:]
        var queue = [(stop: S, level: 0)]
//        var stops = [S]
//        var level = 0
        var routeVisited = Set<Int>()
        var index = queue.startIndex
        
        for (routeIndex, route) in routes.enumerated() {
            for stop in route {
                routesOf[stop, default: []].append(routeIndex)
            }
        }
        
        while index != queue.endIndex {
            
            let (stop, level) = queue[index]
            index += 1
            
            if stop == T { return level }
            
            guard let nextRoutes = routesOf[stop] else { continue }
            for nextRoute in nextRoutes where !routeVisited.contains(nextRoute) {
                for nextStop in routes[nextRoute] {
                    queue.append((nextStop, level + 1))
                    print(queue)
                }
                routeVisited.insert(nextRoute)
            }
        }
        
        return -1
    }
}

//let test = UberCodingTests()
//test.numBusesToDestination()

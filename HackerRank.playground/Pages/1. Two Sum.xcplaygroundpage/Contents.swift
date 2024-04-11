import UIKit

// https://leetcode.com/problems/two-sum/description/

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    guard nums.count <= 10000 else { return [] }
    
    // [Complement : Index]
    var dict: [Int: Int] = [:]
    
    for (index, num) in nums.enumerated() {
        let complement = target - num
        
        if let complementIndex = dict[complement] {
            return [complementIndex, index]
        }
        
        dict[num] = index
    }
    
    return []
}

//print(twoSum([2,7,11,15], 9)) // output [0,1]


func stringFromOccurrences(_ inputString: String) -> String {
    
    var dict: [Character: Int] = [:]

    for char in inputString {
        dict[char, default: 0] += 1
    }

    let sortedDict = dict.sorted { $0.value > $1.value }

    var result = ""
    for (char, count) in sortedDict {
        for _ in 0..<count {
            result.append(char)
        }
    }

    return result
}

// Exemplo de uso:
let inputString = "leet"
let sortedString = stringFromOccurrences(inputString)


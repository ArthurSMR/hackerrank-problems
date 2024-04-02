//import UIKit
//
//// https://www.hackerrank.com/challenges/three-month-preparation-kit-sparse-arrays/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-one

func matchingStrings(strings: [String], queries: [String]) -> [Int] {

    var occurencies: [String: Int] = [:]

    for string in strings {
        occurencies[string, default: 0] += 1
    }

    var result: [Int] = []

    for index in 0..<queries.count {

        let query = queries[index]

        if occurencies[query] == 0 {
            result.append(0)
            continue
        }

        result.append(occurencies[query] ?? 0)
    }

    return result
}

matchingStrings(strings: ["ab", "ab", "abc"], queries: ["ab", "abc", "bc"])


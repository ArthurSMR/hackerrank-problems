import UIKit

// https://www.hackerrank.com/challenges/three-month-preparation-kit-breaking-best-and-worst-records/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-one

func breakingRecords(scores: [Int]) -> [Int] {

    var minimum: Int = scores.first ?? Int.max
    var maximum: Int = scores.first ?? 0

    var minCount: Int = 0
    var maxCount: Int = 0

    for index in 0..<scores.count {

        let score = scores[index]

        if score < minimum {
            minimum = score
            minCount += 1
        }

        if score > maximum {
            maximum = score
            maxCount += 1
        }
    }

    return [maxCount, minCount]
}

breakingRecords(scores: [12, 24, 10, 24])

//func timeConversion(s: String) -> String {
//
//    // Format hh:mm:ssAM or hh:mm:ssPM
//
//    var additionalHours = 0
//
//    var time = s.dropLast(2)
//
//    var separatedTime = time.components(separatedBy: ":").map { Int($0) ?? 0 }
//
//    var hour = separatedTime[0]
//    var minute = separatedTime[1]
//    var second = separatedTime[2]
//
//    if s.hasSuffix("PM") && hour < 12 {
//        additionalHours = 12
//    } else if s.hasSuffix("AM") && hour >= 12 {
//        additionalHours = -12
//    }
//
//    hour += additionalHours
//
//    let timeConverted = String(format:"%02d:%02d:%02d", hour, minute, second)
//
//    return timeConverted
//}
//
//timeConversion(s: "07:05:45PM") // 19:05:45
//timeConversion(s: "12:01:00PM") // 12:01:00
//timeConversion(s: "12:01:00AM") // 00:01:00
//timeConversion(s: "14:30:00PM") // 14:30:00
//timeConversion(s: "07:20:00AM") // 07:20:00

//func matchingStrings(strings: [String], queries: [String]) -> [Int] {
//
//    var occurencies: [String: Int] = [:]
//
//    for string in strings {
//        occurencies[string, default: 0] += 1
//    }
//
//    var result: [Int] = []
//
//    for index in 0..<queries.count {
//
//        let query = queries[index]
//
//        if occurencies[query] == 0 {
//            result.append(0)
//            continue
//        }
//
//        result.append(occurencies[query] ?? 0)
//    }
//
//    return result
//}
//
//matchingStrings(strings: ["ab", "ab", "abc"], queries: ["ab", "abc", "bc"])

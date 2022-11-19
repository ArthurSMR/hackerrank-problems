import UIKit

// https://www.hackerrank.com/challenges/three-month-preparation-kit-time-conversion/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-one

func timeConversion(s: String) -> String {

    // Format hh:mm:ssAM or hh:mm:ssPM

    var additionalHours = 0

    var time = s.dropLast(2)

    var separatedTime = time.components(separatedBy: ":").map { Int($0) ?? 0 }
    
    print(separatedTime)

    var hour = separatedTime[0]
    var minute = separatedTime[1]
    var second = separatedTime[2]

    if s.hasSuffix("PM") && hour < 12 {
        additionalHours = 12
    } else if s.hasSuffix("AM") && hour >= 12 {
        additionalHours = -12
    }

    hour += additionalHours

    let timeConverted = String(format:"%02d:%02d:%02d", hour, minute, second)
    print(timeConverted)
    return timeConverted
}

timeConversion(s: "07:05:45PM") // 19:05:45
timeConversion(s: "07:05:45AM")
timeConversion(s: "12:01:00PM") // 12:01:00
timeConversion(s: "12:01:00AM") // 00:01:00
timeConversion(s: "14:30:00PM") // 14:30:00
timeConversion(s: "07:20:00AM") // 07:20:00

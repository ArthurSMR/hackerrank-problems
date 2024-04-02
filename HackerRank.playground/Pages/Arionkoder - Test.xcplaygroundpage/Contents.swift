//import UIKit
//
//// Smallest Positive Number that not occur on the array
//
////public func solution(_ A : inout [Int]) -> Int {
////
////    guard A.count >= 1, A.count < 100000 else { return -1 }
////
////    let array = A.sorted()
////    var smallest = 1
////
////    while A.contains(smallest) {
////        smallest += 1
////    }
////
////    return smallest
////}
//
//// REAL TEST
//
//
////public func solution(_ S : inout String) -> Bool {
////
////    guard isValidString(&S) else { return false }
////
////    var bHasAlreadyAppeared: Bool = false
////
////    for letter in S {
////
////        if letter == "a" && bHasAlreadyAppeared {
////            return false
////        } else if letter == "b" {
////            bHasAlreadyAppeared = true
////        }
////    }
////
////    return true
////}
//
////func isValidString(_ S : inout String) -> Bool {
////    guard Set(S).isSubset(of: ["a", "b"]),
////          !S.isEmpty,
////          S.count > 0 && S.count < 300000 else { return false }
////
////    return true
////}
//
////var string = "abb"
////solution(&string)
////
////protocol Foo {
////    var moo: String { get }
////}
////
////extension Foo {
////    var moo: String {
////        return "Moo"
////    }
////
////    func test() {
////        print("Foo \(moo)")
////    }
////}
////
////class Bar: Foo {
////
////    var moo: String { return "Mooo" }
////
////    func test() {
////        print("Bar \(moo)")
////    }
////}
////let b: Foo = Bar()
////b.test()
//
//
////let container = UIView()
////let rectangle = UIView()
////
////container.addSubview(rectangle)
////
////container.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
////rectangle.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
////
////rectangle.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
//
////print(rectangle.frame, rectangle.bounds)
//
////var number = 0
////for a in zip([1,2,3,4,5,6,7,8], ["a", "b", "c"]) {
////    print(a)
////    number += 1
////}
////
////print(number)
//
//
//public func solution(_ S : inout String) -> Int {
//
//    // TODO: LEMBRAR PERFORMANCE
//
//    let calls = S.components(separatedBy: "\n")
//
//    guard calls.count <= 100 else { return -1 }
//
//    /// Phone Number : "HH:mm:ss"
//    var dictCalls: [String: String] = [:]
//
//    for call in calls {
//
//        let (timeString, phoneNumber) = splitString(call)
//
//        if let dictCall = dictCalls[phoneNumber] {
//            dictCalls[phoneNumber] = sumTimeStrings(dictCall, timeString)
//
//        } else {
//            dictCalls[phoneNumber] = timeString
//        }
//    }
//
//    return calculate(calls: dictCalls)
//}
//
//func calculate(calls: [String: String]) -> Int {
//
//    var myCalls = applyPromotion(forCalls: calls)
//
//    var totalCents: Int = 0
//
//    for call in myCalls {
//
//        let roundedMinute = roundedUpMinutes(from: call.value)
//
//        if roundedMinute <= 5 {
//            let totalSeconds = secondsFromTimeString(call.value)
//            totalCents += totalSeconds * 3
//
//        } else {
//            totalCents += 150 * roundedMinute
//        }
//    }
//
//    return totalCents
//}
//
//func applyPromotion(forCalls calls: [String: String]) -> [String: String] {
//
//    var allCalls = calls
//
//    var mostCalledKey: String = ""
//    var mostCalledMinutes: String = "00:00:00"
//
//    for call in allCalls {
//
//        if call.value.minutesIsGreaterThan(mostCalledMinutes) {
//            mostCalledMinutes = call.value
//            mostCalledKey = call.key
//        }
//    }
//
//    // Apply promotion
//    allCalls.removeValue(forKey: mostCalledKey)
//
//    return allCalls
//}
//
//func splitString(_ input: String) -> (String, String) {
//
//    let components = input.components(separatedBy: ",")
//
//    guard components.count >= 2 else { return ("", "") }
//
//    let minutesPart = components[0]
//    let cellPhoneNumber = components[1]
//
//    guard !cellPhoneNumber.hasPrefix("0") else {
//        return ("", "")
//    }
//
//    return (minutesPart, cellPhoneNumber)
//}
//
//func sumTimeStrings(_ timeString1: String, _ timeString2: String) -> String {
//    let formatter = DateFormatter()
//    formatter.dateFormat = "HH:mm:ss"
//
//    if let date1 = formatter.date(from: "\(timeString1)"),
//       let date2 = formatter.date(from: "\(timeString2)") {
//
//        let calendar = Calendar.current
//        let totalSeconds = calendar.component(.second, from: date1) + calendar.component(.second, from: date2)
//        let totalMinutes = calendar.component(.minute, from: date1) + calendar.component(.minute, from: date2) + totalSeconds / 60
//
//        // Calcular o número de horas, minutos e segundos a partir dos minutos totais
//        let hours = totalMinutes / 60
//        let remainingMinutes = totalMinutes % 60
//        let remainingSeconds = totalSeconds % 60
//
//        // Criar uma nova data para representar o resultado
//        if let resultDate = calendar.date(bySettingHour: Int(hours), minute: Int(remainingMinutes), second: Int(remainingSeconds), of: Date()) {
//            return formatter.string(from: resultDate)
//        }
//    }
//
//    return ""
//}
//
//extension String {
//    func minutesIsGreaterThan(_ timeString: String) -> Bool {
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = "HH:mm:ss"
//
//        if let date1 = formatter.date(from: "\(self)"),
//           let date2 = formatter.date(from: "\(timeString)") {
//
//            let calendar = Calendar.current
//            let minutes1 = calendar.component(.minute, from: date1)
//            let minutes2 = calendar.component(.minute, from: date2)
//
//            return minutes1 > minutes2
//        }
//
//        return false
//    }
//}
//
//func roundedUpMinutes(from timeString: String) -> Int {
//    let formatter = DateFormatter()
//    formatter.dateFormat = "HH:mm:ss"
//
//    if let date = formatter.date(from: timeString) {
//        let components = Calendar.current.dateComponents([.minute, .second], from: date)
//
//        guard let second = components.second, let minute = components.minute else { return 0 }
//
//        let roundedMinutes = second > 0 ? minute + 1 : minute
//
//        return roundedMinutes
//    }
//
//    return 0
//}
//
//func secondsFromTimeString(_ timeString: String) -> Int {
//    let components = timeString.components(separatedBy: ":")
//
//    if components.count == 3,
//       let hours = Int(components[0]),
//       let minutes = Int(components[1]),
//       let seconds = Int(components[2]) {
//
//        return (hours * 3600) + (minutes * 60) + seconds
//    }
//
//    return 0 // Retorna 0 se houver um problema na formatação
//}
//
////var string = """
////00:01:07,400-234-090
////00:05:01,701-080-080
////00:05:00,400-234-090
////"""
////var string = """
////00:01:07,400-234-090
////00:01:00,700-080-080
////00:05:00,400-234-090
////"""
////solution(&string)
//

struct Eai {
    
    var dict: [String: String]
    
    init(dict: [String: String]) {
        self.dict = dict
        self.dict["ambient"] = "app"
        print(self.dict)
    }
}

var legal: [String: String] = [
    "eai": "xama"
]
var eai = Eai(dict: legal)

import UIKit

//func calPoints(_ ops: [String]) -> Int {
//
//    var record: [Int] = []
//
//    for index in 0..<ops.count {
//        switch ops[index] {
//        case "+":
//
//            guard record.count >= 2 else { break }
//
//            let firstPreviousRecordIndex = record.count - 1
//            let secondPreviousRecordIndex = record.count - 2
//
//            record.append(record[firstPreviousRecordIndex] + record[secondPreviousRecordIndex])
//
//        case "D":
//            if let lastRecord = record.last {
//                record.append(lastRecord * 2)
//            }
//
//        case "C":
//            record.removeLast()
//
//        default:
//            if let newRecord = Int(ops[index]) {
//                record.append(newRecord)
//            }
//        }
//        print(record)
//    }
//
//
//    return record.reduce(0, +)
//}
//
//calPoints(["5", "2", "C", "D", "+"])
//calPoints(["5", "-2", "4", "C", "D", "9", "+", "+"])













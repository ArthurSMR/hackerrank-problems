import UIKit

//var solution = [-1, -100, 3, 99]
//let k = 2
//
//for _ in 0..<k {
//
//    if let lastElement = solution.last {
//        solution.removeLast()
//        solution.insert(lastElement, at: 0)
//    }
//}
//
//print(solution)
//
//

//func solution(_ s: String) -> String {
//
//
//    var intArray: [String] = []
//    var charArray: [String] = []
//    var theString: String = ""
//
//    for char in s {
//        if let number = Int(String(char)) {
//            intArray.append(String(number))
//        } else {
//            charArray.append(String(char))
//        }
//    }
//
//    intArray = intArray.sorted()
//    charArray = charArray.sorted()
//
//    for index in 0..<intArray.count {
//        theString += intArray[index]
//        theString += charArray[index]
//    }
//
//    return theString
//}
//
//solution("z3b1a2")

func computeClosestToZero(_ ts: [Int]) -> Int {

    guard !ts.isEmpty else { return 0 }
    
    var closestToZero: Int = ts[0]

    for index in 0..<ts.count {
        var temp = ts[index]

        if temp == 0 {
            return 0
        }
        
        var positiveClosestToZero = closestToZero

        if temp < 0 {
            positiveClosestToZero = positiveClosestToZero * -1
            temp = temp * (-1)
        }

        if temp <= positiveClosestToZero {
            closestToZero = ts[index]
        }
    }

    return closestToZero
}

computeClosestToZero([7,5,9,1,4])
computeClosestToZero([-15, -7, -9, -14, -12])
computeClosestToZero([-5, -4, -2, 12, -40, 4, 2, 18, 11,5])

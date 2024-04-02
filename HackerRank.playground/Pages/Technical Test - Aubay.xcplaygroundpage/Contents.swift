// MARK: - Technical Test 10/03/24

func existsInArray(_ numbers: [Int], k: Int) -> Bool {
    guard numbers.count <= 1_000_000,
          !numbers.isEmpty else { return false }
    
    var left = 0
    var right = numbers.count - 1
    
    while left <= right {
        
        let middleIndex = (left + right) / 2
        let middleValue = numbers[middleIndex]
        
        if k < middleValue {
            right = middleIndex - 1
        } else if k > middleValue {
            left = middleIndex + 1
        } else if k == middleValue {
            return true
        }
    }
    
    return false
}

let numbers = [-9, 14, 37, 102]
print(existsInArray(numbers, k: 102)) // true
print(existsInArray(numbers, k: 36)) // false

let (x,y,z) = (2, 4.1, false)

print(x,y,z)

extension Int {
    mutating func square() {
        self = self * self
    }
}

var number = 2
number.square()

var scores = [1: "tok"]

for (key, value) in scores { }



//let three = 3
//let pi = three + 0.14159
//
//print(pi)

var aaa = [Int]()

let first: String?
let middleName: String? = nil
let lastName = "Jackson"

let greeting = "Hi, \(first ?? middleName ?? lastName)"

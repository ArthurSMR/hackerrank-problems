import UIKit

var solution = [-1, -100, 3, 99]
let k = 2

for _ in 0..<k {
    
    if let lastElement = solution.last {
        solution.removeLast()
        solution.insert(lastElement, at: 0)
    }
}

print(solution)

import UIKit

// https://www.glassdoor.com/Interview/Consecutive-zeros-The-goal-of-this-challenge-is-to-analyze-a-binary-string-consisting-of-only-zeros-and-ones-Your-code-sho-QTN_6374438.htm

// Consecutive zeros The goal of this challenge is to analyze a binary string consisting of only zeros and ones. Your code should find the biggest number of consecutive zeros in the string. For example, given the string: "1001101000110" The biggest number of consecutive zeros is 3. Define a function named consecutive_zeros that takes a single parameter, which is the string of zeros and ones. Your function should return the number described above.

func consecutiveZeros(word: String) -> Int {

    var biggestConsecutiveZeros: Int = Int.min
    var consecutiveZeros: String = ""


    for (index, letter) in word.enumerated() {

        if letter == "0" {

            consecutiveZeros.append(letter)

            if biggestConsecutiveZeros < consecutiveZeros.count {
                biggestConsecutiveZeros = consecutiveZeros.count
            }

        } else {
            consecutiveZeros = ""
        }
    }
    return biggestConsecutiveZeros
}

consecutiveZeros(word: "1000000001101100000100000000000110") // 11
consecutiveZeros(word: "1001101000110") // 3

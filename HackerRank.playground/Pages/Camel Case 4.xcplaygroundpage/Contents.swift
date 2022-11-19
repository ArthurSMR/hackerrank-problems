import UIKit

/*
 
 https://www.hackerrank.com/challenges/three-month-preparation-kit-camel-case/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-one
 
 1º)    S -> Split = iPad -> i pad
        C -> Combine = space-delimited -> camel case
 
 2º)    M -> Method
        C -> Class
        V -> Variable
 */

var inputs: [String] = [
                        "S;V;iPad",
                        "C;M;mouse pad",
                        "C;C;code swarm",
                        "S;C;OrangeHighlighter",
                        "S;M;plasticCup()",
                        "C;V;mobile phone",
                        "C;C;coffee machine",
                        "S;C;LargeSoftwareBook",
                        "C;M;white sheet of paper",
                        "S;V;pictureFrame"
                        ]

while let input = readLine() {
    // This method is used to read stdin
}

extension String {
    
     mutating func firstLetterLowercased() {
        let dropFirst = self.dropFirst()
        self = self.prefix(1).lowercased() + dropFirst
    }
    
    mutating func uppercasedAfterSpace() {
        for char in self {
            if char.isUppercase {
                guard let index = self.firstIndex(of: char) else { continue }
                self.insert(" ", at: index)
            }
        }
    }
}

for input in inputs {
    
    let separatedInput = input.components(separatedBy: ";")
    let operation = separatedInput[0]
    let type = separatedInput[1]
    var word = separatedInput[2]
    
    if operation == "S" {
        
        if type == "C" {
            word.firstLetterLowercased()
        }
        
        word.uppercasedAfterSpace()
        word = word.lowercased()
        
        if type == "M" {
            word = String(word.dropLast(2))
        }
        
    } else if operation == "C" {
        
        word = word.capitalized
                .components(separatedBy: .whitespaces).joined()
        
        if type == "M" {
            word.append("()")
            word.firstLetterLowercased()
        } else if type == "V" {
            word.firstLetterLowercased()
        }
    }
    
    print(word)
}

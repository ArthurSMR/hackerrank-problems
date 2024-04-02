import Foundation


final class HtmlMutableString: NSObject, NSMutableCopying {
    /// Please do not modify this class.
    static var mutationsCount = 0
    
    private(set) var data: String = ""
    override var description: String {
        return data
    }
    
    override init() {
        super.init()
    }
    
    init(string: String) {
        super.init()
        data = string
    }
    
    func append(_ val: HtmlMutableString) {
        data.append(val.data)
    }
    
    func mutableCopy(with zone: NSZone? = nil) -> Any {
        HtmlMutableString.mutationsCount += 1
        return HtmlMutableString(string: data)
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? HtmlMutableString else { return false }
        return data == object.data
    }
}

struct HtmlString: CustomDebugStringConvertible, ExpressibleByStringLiteral, Equatable {
    /// Please provide finished implementation here.
    
    static func == (lhs: HtmlString, rhs: HtmlString) -> Bool {
        lhs.data.isEqual(rhs.data)
    }
    
    var debugDescription: String = ""
    private var data = HtmlMutableString()
    
    public init(stringLiteral value: String) {
        self.debugDescription = value
        self.data = HtmlMutableString(string: value)
    }
    
    init(_ data: HtmlMutableString) {
        self.data = data.mutableCopy() as! HtmlMutableString
        self.debugDescription = data.description
    }
    
    mutating func append(_ param: HtmlMutableString) {
        data = HtmlMutableString(string: data.description)
        data.append(param)
        self.debugDescription += param.description
    }
}

var htmlString: HtmlString = "<strong>Sample Title</strong>"
let test1 = String(describing: htmlString)

if test1 == "<strong>Sample Title</strong>" {
    print("test1 accepted")
}

let otherHtmlString: HtmlString = "<strong>Sample Title</strong>"
print("test2", otherHtmlString == htmlString)

htmlString.append(HtmlMutableString(string: "<p>some paragraph</p>"))

if "<strong>Sample Title</strong><p>some paragraph</p>" == htmlString {
    print("test3 accepted")
}


// MARK: - Exercise 2

public func solution(_ A : inout String, _ B : inout String) -> Int {
    
    guard A.count >= 1 && A.count < 100,
          A.count == B.count,
          A.containsOnlyLetters,
          B.containsOnlyLetters else { return 0 }
    
    let aStr = Array(A)
    let bStr = Array(B)
    
    var correspondingFragments: Int = 0
    
    for index in 0..<aStr.count {
        
        var substringA: [Character] = []
        var substringB: [Character] = []
        var endIndex = index
        
        while endIndex < aStr.count {
            substringA.append(aStr[endIndex])
            substringB.append(bStr[endIndex])
            
            if isCorresponding(substringA, substringB) {
                correspondingFragments += 1
            }
            
            endIndex += 1
        }
    }
    
    return correspondingFragments
}

extension String {
    var containsOnlyLetters: Bool {
        return self.allSatisfy { char in
            char.isLetter
        }
    }
}

private func isCorresponding(_ a: [Character], _ b: [Character]) -> Bool {
    return a.sorted() == b.sorted()
}

var A = "dBacaAA"
var B = "caBdaaA"

//var A = "zzzX"
//var B = "zzzX"

//var A = "abc"
//var B = "ABC"

//var A = "ZZXYOz"
//var B = "OOYXZZ"
solution(&A, &B)

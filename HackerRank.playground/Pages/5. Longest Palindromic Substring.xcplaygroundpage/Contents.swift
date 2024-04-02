import UIKit

// https://leetcode.com/problems/longest-palindromic-substring/\

// My solution -> Bad performance
//func longestPalindrome(_ s: String) -> String {
//
//    guard s.count < 1000 else { return "" }
//
//    var longestPalindrome = ""
//
//    var backwardS = s
//    var forwardS = s
//
//    for _ in forwardS {
//
//        for _ in backwardS.reversed() {
//
//            if String(backwardS.reversed()) == backwardS &&
//                backwardS.count > longestPalindrome.count {
//                longestPalindrome = backwardS
//            } else {
//                backwardS.removeLast()
//            }
//        }
//
//        forwardS.removeFirst()
//        backwardS = forwardS
//    }
//
//    return longestPalindrome
//}

//func longestPalindrome(_ s: String) -> String {
//    let s = Array(s)
//    var center = 0
//    var start = 0
//    var maxLength = 0
//
//    while center < s.count {
//        var left = center
//        var right = center
//
//        print("Left: \(left), Right: \(right)")
//
//        while right < s.count - 1 && s[left] == s[right + 1] {
//            right += 1
//            print("1) right < s.count \(right)")
//        }
//
//        center = right + 1
//
//        while left > 0 && right < s.count-1 && s[left - 1] == s[right + 1] {
//            left -= 1
//            right += 1
//            print("2)  \(left), \(right)")
//        }
//
//        if right - left + 1 > maxLength {
//            start = left
//            maxLength = right - left + 1
//            print("3) maxLength: \(maxLength)")
//        }
//    }
//    return String(s[start..<(start+maxLength)])
//}
//
//longestPalindrome("araraaaa")

//longestPalindrome("civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth")



func longestPalindrome(_ s: String) -> String {
    
    let s = Array(s)
    var resLen: Int = 0
    var res: String = ""

    for i in 0..<s.count {

        var l = i
        var r = i

        // Odd lenght
        while l >= 0 && r < s.count && s[l] == s[r] {

            if r - l + 1 > resLen {
                let interval = l...r
                res = String(s[interval])
                resLen = res.count
            }

            l -= 1
            r += 1
        }

        // Even lenght
        l = i
        r = i + 1
        while l >= 0 && r < s.count && s[l] == s[r] {

            if r - l + 1 > resLen {
                let interval = l...r
                res = String(s[interval])
                resLen = res.count
            }
            
            l -= 1
            r += 1
        }
        
    }
    
    return res
}

/*
 Tests:
 "a" -> 1
 "aa" -> 2
 "aba" -> 3
 "babad" -> 3
 
 1 <= s.length <= 1000
 s consist of only digits and English letters.
 
 */

longestPalindrome("aa")
longestPalindrome("babad")
longestPalindrome("bababd")
longestPalindrome("aaaaa")
longestPalindrome("civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth")

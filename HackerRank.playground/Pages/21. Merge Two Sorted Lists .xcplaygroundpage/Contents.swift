import UIKit

// https://leetcode.com/problems/merge-two-sorted-lists/description/?envType=featured-list&envId=top-interview-questions?envType=featured-list&envId=top-interview-questions

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int,
                _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    
    
    
    
    return nil
}

var list1 = [1,2,4]
var list2 = [1,3,4]

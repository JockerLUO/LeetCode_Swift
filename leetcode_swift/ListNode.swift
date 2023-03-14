//
//  ListNode.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/11.
//

import Foundation

public class ListNode: NSObject {
    public let val: Int
    public var next: ListNode?
    public override init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    static func format(_ ls: [Int])-> ListNode? {
        guard !ls.isEmpty else {
            return nil
        }
        
        let headNode = ListNode(0)
        var nextNode: ListNode?  = headNode
        for i in ls {
            nextNode?.next = ListNode(i)
            nextNode = nextNode?.next
        }
        return headNode.next!
    }
    
    var list: [Int] {
        var next = self.next
        var ls: [Int] = [val]
        var nodes = [ListNode]()
        while next != nil {
            if nodes.contains(next!) {
                break
            }
            nodes.append(next!)
            ls.append(next!.val)
            next = next?.next
            if next === self {
                break
            }
        }
        return ls
    }
    
    public override var description: String {
        return "\(list)"
    }
}

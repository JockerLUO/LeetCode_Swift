//
//  File.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/26.
//

import Foundation

extension Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        var slow = head
        var fast = head
        for _ in 0..<n {
            if fast.next != nil {
                fast = fast.next!
            } else {
                return head.next
            }
        }
        
        while fast.next != nil {
            fast = fast.next!
            slow = slow.next!
        }
        slow.next = slow.next?.next
        return head
    }
}

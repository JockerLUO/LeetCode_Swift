//
//  061_Rotate_List.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/8.
//

import Foundation

extension Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head?.next == nil || k == 0 {
            return head
        }
        var curr = head
        var count = 1
        while curr?.next != nil {
            curr = curr?.next
            count += 1
        }
        curr?.next = head
        
        curr = head
        var n = count - k % count - 1
        while n > 0 {
            curr = curr?.next
            n -= 1
        }
        let res = curr?.next
        curr?.next = nil
        
        return res
    }
}

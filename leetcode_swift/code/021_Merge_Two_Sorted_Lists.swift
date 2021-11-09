//
//  021_Merge_Two_Sorted_Lists.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/26.
//

import Foundation

extension Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var offset1 = l1
        var offset2 = l2
        let head = ListNode(Int.min)
        var curr: ListNode  = head
        while offset1 != nil || offset2 != nil {
            if offset1 == nil {
                curr.next = offset2
                offset2 = offset2?.next
            } else if offset2 == nil {
                curr.next = offset1
                offset1 = offset1?.next
            } else {
                if offset1!.val < offset2!.val {
                    curr.next = offset1
                    offset1 = offset1?.next
                } else {
                    curr.next = offset2
                    offset2 = offset2?.next
                }
            }
            curr = curr.next!
        }
        return head.next
    }
}

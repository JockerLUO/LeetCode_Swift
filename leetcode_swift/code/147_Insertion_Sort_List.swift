//
//  147_Insertion_Sort_List.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/7/14.
//

import Foundation

extension Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        var left = head
        var right = head
        var curr = head.next
        head.next = nil
        while curr != nil {
            let temp = curr?.next
            curr?.next = nil

            if curr!.val <= left.val {
                curr?.next = left
                left = curr!
            } else if curr!.val >= right.val {
                right.next = curr
                curr?.next = nil
                right = curr!
            } else {
                var node: ListNode? = left
                while node?.next != nil {
                    if let val = node?.next?.val, val > curr!.val {
                        curr?.next = node?.next
                        node?.next = curr
                        break
                    }
                    node = node?.next
                }
            }
            curr = temp
        }
        return left
    }
}

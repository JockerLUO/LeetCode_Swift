//
//  083_Remove_Duplicates_from_Sorted_List.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/11.
//

import Foundation

extension Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var right = head
        while right != nil {
            while right?.next?.val == right?.val {
                right?.next = right?.next?.next
            }
            right = right?.next
        }
        return head
    }
}

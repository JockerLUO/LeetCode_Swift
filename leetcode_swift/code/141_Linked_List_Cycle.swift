//
//  141_Linked_List_Cycle.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/6/15.
//

import Foundation

extension Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        ///使用快慢指针
        var low = head
        var quick = head
        while low?.next != nil, quick?.next?.next != nil {
            low = low?.next
            quick = quick?.next?.next
            if low === quick {
                return true
            }
        }
        return false
    }
}

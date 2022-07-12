//
//  142_Linked_List_Cycle_II.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/6/15.
//

import Foundation

extension Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var low = head
        var quick = head
        var hasCycel = false
        while low?.next != nil, quick?.next?.next != nil {
            low = low?.next
            quick = quick?.next?.next
            if low === quick {
                hasCycel = true
                break
            }
        }
        
        if hasCycel {
            var curr = head
            while curr !== low {
                curr = curr?.next
                low = low?.next
            }
            return curr
        }
        return nil
    }
}

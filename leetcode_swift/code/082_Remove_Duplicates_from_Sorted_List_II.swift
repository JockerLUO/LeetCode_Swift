//
//  082_Remove_Duplicates_from_Sorted_List_II.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/11.
//

import Foundation

extension Solution {
    func deleteDuplicates_ll(_ head: ListNode?) -> ListNode? {
        
        var left = head
        var right = head?.next
        var head = head
    
        while right != nil {
            if right?.val != right?.next?.val {
                if left?.val == right?.val, left === head {  //链表头部连续多个重复
                    left = right?.next
                    right = right?.next
                    head = left
                } else {
                    if left?.next === right { //左右连续,同时右移一位就行
                        left = right
                    } else {
                        left?.next = right?.next
                    }
                }
            }
            right = right?.next
        }

        if left?.val == right?.val {
            return nil
        } else {
            return head
        }
    }
}

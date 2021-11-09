//
//  024_Swap_Nodes_in_Pairs.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/27.
//

import Foundation

extension Solution {
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let res = ListNode(-1)
        var offset = 0
        res.next = head
        
        var prev: ListNode?
        var left: ListNode? = res
        var right: ListNode? = head
        
        //        print("@", res, "\n")
        
        repeat {
            //            print(offset, res, prev?.val ?? 0, left?.val ?? 0, right?.val ?? 0)
            
            if offset % 2 == 1 {
                let temp1 = right?.next
                
                prev?.next = right
                right?.next = left
                left?.next = temp1
                
                let temp2 = left
                left = right
                right = temp2
            }
            
            prev = left
            left = right
            right = right?.next
            
            //            print(offset, res, prev?.val ?? 0, left?.val ?? 0, right?.val ?? 0)
            //            print()
            offset += 1
            
        } while (right != nil && left != nil)
        
        return res.next
    }
    
//    func swapPairs(_ head: ListNode?) -> ListNode? {
//        if head == nil || head?.next == nil {
//            return head
//        }
//        let next = head?.next
//        head?.next = swapPairs(next?.next)
//        next?.next = head
//        return next
//    }
}

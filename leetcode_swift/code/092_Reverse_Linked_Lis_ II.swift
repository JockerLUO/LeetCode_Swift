//
//  092_Reverse_Linked_Lis_ II.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/26.
//

import Foundation

extension Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if left == right {
            return head
        }
        
        let len = right - left
        var lNode = head, rNode = head
        for i in 0..<(right - 1) {
            rNode = rNode?.next
            if i > len {
                lNode = lNode?.next
            }
        }
        
        let pre = lNode?.next
        
        var currNode: ListNode? = lNode?.next
        var preNode: ListNode? = lNode
        while preNode !== rNode {
            let temp = currNode?.next

            currNode?.next = preNode
            preNode = currNode
            currNode = temp
        }
        
        if left != 1 {
            lNode?.next = preNode
            pre?.next = currNode
            return head
        } else {
            lNode?.next = currNode
            return preNode
        }
    }
}

//
//  086_Partition_List.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/15.
//

import Foundation

extension Solution {
    
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        
        var small: ListNode? = ListNode(0)
        let smallHead = small;
        var large: ListNode? = ListNode(0)
        let largeHead = large;

        var head = head
        while head != nil {
            if head!.val < x {
                small?.next = head
                small = small?.next
            } else {
                large?.next = head
                large = large?.next
            }
            head = head?.next
        }
        large?.next = nil
        small?.next = largeHead?.next
        return smallHead?.next
    }

    
//    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
//        var tagNode = ListNode(x)
//        var leftNode: ListNode?
//        var rightNode: ListNode?
//        var currNode: ListNode? = head
//        while currNode != nil {
//            if currNode!.val == x {
//                let temp = currNode!.next
//                currNode!.next = tagNode.next
//                tagNode = currNode!
//                if temp != nil {
//                    currNode = temp!
//                } else {
//                    break
//                }
//            }
//            if currNode!.val < x {
//                leftNode?.next = currNode
//                leftNode = currNode
//            } else if currNode!.val > x {
//                if rightNode == nil {
//                    tagNode.next = currNode
//                }
//                rightNode?.next = currNode
//                rightNode = currNode
//            }
//            currNode = currNode?.next
//        }
//        leftNode?.next = tagNode
//        return head
//    }
}

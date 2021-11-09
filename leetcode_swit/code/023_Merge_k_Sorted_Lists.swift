//
//  023_Merge_k_Sorted_Lists.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/27.
//

import Foundation

extension Solution {
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let lists = lists.compactMap { $0 }
        guard lists.count > 0 else {
            return nil
        }
        let head = ListNode(Int.min)
        var curr: ListNode  = head
        
        var ls = lists.sorted { ($0.val > $1.val) }
        
        while !ls.isEmpty {
            guard let nextNode = ls.popLast() else {
                continue
            }
            curr.next = nextNode
            curr = curr.next!
            
            if let node = nextNode.next {
                ls.append(node)
                ls = ls.sorted { ($0.val > $1.val) }
                
//                for (i, v) in ls.enumerated() {
//                    if (v.val < node.val) {
//                        ls.insert(node, at: i)
//                        break
//                    } else if (i == ls.count - 1) {
//                        ls.append(node)
//                    }
//                }
            }
        }
        return head.next
    }
    
    //    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    //        guard lists.count > 0 else {
    //            return nil
    //        }
    //
    //        var left = 0
    //        var right = lists.count - 1
    //
    //        var lists = lists
    //
    //        while right > 0 {
    //            left = 0
    //            while left < right {
    //                lists[left] = _mergeTwoLists(lists[left], lists[right])
    //                left += 1
    //                right -= 1
    //            }
    //        }
    //
    //        return lists[0]
    //    }
    //
    //    private func _mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    //        let dummy = ListNode(0)
    //        var node = dummy
    //
    //        var l1 = l1
    //        var l2 = l2
    //
    //        while l1 != nil && l2 != nil {
    //            if l1!.val < l2!.val {
    //                node.next = l1
    //                l1 = l1!.next
    //            } else {
    //                node.next = l2
    //                l2 = l2!.next
    //            }
    //
    //            node = node.next!
    //        }
    //
    //        node.next = l1 ?? l2
    //
    //        return dummy.next
    //    }
}

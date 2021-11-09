//
//  025_Reverse_Nodes_i_ k-Group.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/28.
//

import Foundation

extension Solution {
    
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head

        var prev = dummy                             // prev = A
        while prev.next != nil {                     // A->B->C->D->E => A->D->C->B->E
            var groupTail : ListNode? = prev
            for _ in 1...k {
                groupTail = groupTail?.next
            }
            guard let _ = groupTail else {            // groupTail = D
                break
            }

            let nextGroupHead = groupTail!.next      // nextGroupHead = E
            var last = nextGroupHead                 // last = E
            var current : ListNode? = prev.next      // current = B
            while current != nil && current !== nextGroupHead {
                let next = current!.next             // next = C
                current!.next = last                 // B -> E
                last = current                       // last = B
                current = next                       // current = C
            }

            groupTail = prev.next
            prev.next = last
            prev = groupTail!
        }

        return dummy.next
    }
    
//    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
//        guard k > 1 else {
//            return head
//        }
//
//        let res = ListNode(-1)
//        var offset = 0
//        res.next = head
//
//        var list = [ListNode?]()
//        list.append(nil)
//        list.append(res)
//        for i in 2...k {
//            list.append(list[i - 1]?.next)
//        }
//
//        repeat {
//
//            if offset % k == 1 {
//
//                let temp = list.last??.next
//
//                var sublist: [ListNode?] = Array(list[1...])
//
//                for (i, node) in sublist.enumerated() {
//                    if i != 0 {
//                        node?.next = sublist[i - 1]
//                    } else {
//                        node?.next = temp
//                    }
//                }
//                let pre = list.first!
//                pre?.next = sublist.last!
//                sublist.append(pre)
//
//                list = sublist.reversed()
//            }
//
//            let count = list.count
//            for i in 0..<count {
//                if i != count - 1 {
//                    list[i] = list[i + 1]
//                } else {
//                    list[i] = list[i]?.next
//                }
//            }
//            offset += 1
//
//        } while list.last! != nil
//
//        return res.next
//    }
}

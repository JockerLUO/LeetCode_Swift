//
//  148_Sort_List.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/7/15.
//

import Foundation

extension Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        var list = [ListNode]()
        list.append(ListNode(Int.min))
        list.append(ListNode(Int.max))

        var curr = head
        while true {
            var left = 0
            var right = list.count - 1
            while right - left > 1 {
                let mid = (left + right) / 2
                if curr.val > list[mid].val {
                    left = mid
                } else if curr.val < list[mid].val {
                    right = mid
                } else {
                    right = mid
                    break
                }
            }
            list.insert(curr, at: right)
            if curr.next != nil {
                curr = curr.next!
            } else {
                break
            }
        }

        let cHead = list[1]
        curr = cHead
        for i in 2..<list.count - 1 {
            curr.next = list[i]
            curr = list[i]
        }
        curr.next = nil

        return cHead
    }
    
//    func sortList(_ head: ListNode?) -> ListNode? {
//        let dummyHead = ListNode(0)
//        dummyHead.next = head
//
//        var p = head
//        var length = 0
//        while p != nil {
//            length += 1
//            p = p?.next
//        }
//
//        var size = 1
//        while size < length {
//            var cur = dummyHead.next
//            var tail = dummyHead
//
//            while cur != nil {
//                let left = cur
//                let right = cut(left, size)
//                cur = cut(right, size)
//                tail.next = merge(left, right)
//                while tail.next != nil {
//                    tail = tail.next!
//                }
//            }
//            size *= 2
//        }
//        return dummyHead.next
//    }
//
//
//    private func cut(_ head: ListNode?, _ size: Int) -> ListNode? {
//        var p = head, n = size
//        while n > 0, p != nil {
//            n -= 1
//            p = p?.next
//        }
//        if p == nil {
//            return nil
//        }
//
//        let next = p?.next
//        p?.next = nil
//        return next
//    }
//
//    private func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        var l1 = l1, l2 = l2
//        let dummyHead = ListNode(0)
//        var p = dummyHead
//        while l1 != nil, l2 != nil {
//            if l1!.val < l2!.val {
//                p.next = l1
//                l1 = l1?.next
//            } else {
//                p.next = l2
//                l2 = l2?.next
//            }
//            p = p.next!
//        }
//        p.next = l1 != nil ? l1 : l2
//        return dummyHead.next
//    }
}

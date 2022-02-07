//
//  117_Populating_Next_Right_Pointers_in_Each_Node_II.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/26.
//

import Foundation

extension Solution {
    func connect_II(_ root: Node?) -> Node? {
        var head = root
        var level = 0
        while head != nil {
            level += 1

            var temp: Node?
            while head != nil {
                var nextNode: Node?
                var temp1 = head?.next
                
                while nextNode == nil, temp1 != nil {
                    if temp1?.left != nil {
                        nextNode = temp1?.left
                    } else if temp1?.right != nil {
                        nextNode = temp1?.right
                    } else {
                        temp1 = temp1?.next
                    }
                }
                
                if head?.right != nil {
                    head?.left?.next = head?.right
                    head?.right?.next = nextNode
                } else {
                    head?.left?.next = nextNode
                }
                
                if temp == nil, (head?.left != nil || head?.right != nil) {
                    temp = head
                }
                head = head?.next
            }
            if let node = temp?.left {
                head = node
            } else if let node = temp?.right {
                head = node
            }
        }
        return root
    }
}

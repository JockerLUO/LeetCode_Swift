//
//  116_Populating_Next_Right_Pointers_in_Each_Node.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/26.
//

import Foundation

extension Solution {
    func connect(_ root: Node?) -> Node? {
        var head = root
        while head?.left != nil {
            let temp = head
            while head != nil {
                head?.left?.next = head?.right
                head?.right?.next = head?.next?.left
                head = head?.next
            }
            head = temp?.left
        }
        return root
    }
}

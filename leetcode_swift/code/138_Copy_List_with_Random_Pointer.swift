//
//  138_Copy_List_with_Random_Pointer.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/6/14.
//

import Foundation

extension Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        guard let head = head else {
            return nil
        }
        let root = Node(head.val)
        var nodes = [Node]()
        var cNodes = [Node]()

        var curr: Node? = head
        var currC: Node? = root
        
        nodes.append(curr!)
        cNodes.append(currC!)

        while curr?.next != nil {
            let cNode = Node(curr!.next!.val)
            currC?.next = cNode
            
            curr = curr?.next
            currC = currC?.next
            
            nodes.append(curr!)
            cNodes.append(currC!)
        }
        
        curr = head
        currC = root
        while curr != nil {
            if let random = curr?.random {
                if let index = nodes.firstIndex(where: { $0 == random }) {
                    currC?.random = cNodes[index]
                }
            }
            curr = curr?.next
            currC = currC?.next
        }
        
        return root
    }
}

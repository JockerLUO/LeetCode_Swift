//
//  099_Recover_Binary_Search_Tree.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/12/1.
//

import Foundation

extension Solution {
    func recoverTree(_ root: TreeNode?) {
        guard let root = root else { return }
        Self.flag = false
        Self.node1 = nil
        Self.node2 = nil
//        print(root)
        _recoverTree(root)
        
        if let node1 = Self.node1, let node2 = Self.node2 {
            let temp = node2.val
            node2.val = node1.val
            node1.val = temp
        }
        
//        print(root)
    }
        
    static var flag = false
    static var node1: TreeNode?
    static var node2: TreeNode?
        
    private func _recoverTree(_ node:TreeNode) {
        if Self.flag {
            return
        }
        
        if let lNode = node.left {
            _recoverTree(lNode)
        }
        
        if let node1 = Self.node1, node1.val > node.val {
//            print(node.val)
            Self.node2 = node
        } else {
            if Self.node2 == nil {
                Self.node1 = node
            } else {
                Self.flag = true
            }
        }

        if let rNode = node.right {
            _recoverTree(rNode)
        }
    }
}

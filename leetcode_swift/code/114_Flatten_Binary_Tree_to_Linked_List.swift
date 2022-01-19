//
//  114_Flatten_Binary_Tree_to_Linked_List.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/19.
//

import Foundation

extension Solution {
    
    func flatten(_ root: TreeNode?) {
        let head: TreeNode? = TreeNode(0)
        var curr = head
        _flatten(root, &curr)
        root?.left = nil
        root?.right = head?.right?.right
    }

    //前序遍历
    private func _flatten(_ root: TreeNode?, _ curr: inout TreeNode?) {
        if root == nil {
            return
        }
        curr?.right = TreeNode(root!.val)
        curr = curr?.right
        _flatten(root?.left, &curr)
        _flatten(root?.right, &curr)
    }
    
//    func flatten(_ root: TreeNode?) {
//        Self.last = nil
//        _flatten(root)
//    }
//
//    ///后序遍历
//    static var last: TreeNode?
//    private func _flatten(_ root: TreeNode?) {
//        if root == nil {
//            return
//        }
//        _flatten(root?.right)
//        _flatten(root?.left)
//        root?.right = Self.last
//        root?.left = nil
//        Self.last = root
//    }
}

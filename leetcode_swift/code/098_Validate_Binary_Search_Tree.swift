//
//  098_Validate_Binary_Search_Tree.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/12/1.
//

import Foundation

extension Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }
        var maxNum = Int.min
        return _traversal(root, &maxNum)
    }
    
    private func _traversal(_ node:TreeNode, _ maxNum: inout Int) -> Bool {
        
        if let leftNode = node.left {
            if !_traversal(leftNode, &maxNum) {
                return false
            }
        }
        
        if maxNum >= node.val {
            return false
        }
        maxNum = node.val

        if let rightNode = node.right {
            if !_traversal(rightNode, &maxNum) {
                return false
            }
        }
        return true
    }
}

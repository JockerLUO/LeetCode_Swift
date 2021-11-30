//
//  094_Binary_Tree_Inorder_Traversal.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/30.
//

import Foundation

extension Solution {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var nums = [Int]()
        _inorderTraversal(root, &nums)
        return nums
    }
    
    private func _inorderTraversal(_ node:TreeNode, _ nums: inout [Int]) {
        if let leftNode = node.left {
            _inorderTraversal(leftNode, &nums)
        }
        nums.append(node.val)
        if let rightNode = node.right {
            _inorderTraversal(rightNode, &nums)
        }
    }
}

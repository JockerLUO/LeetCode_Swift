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
        var nums = [Int]()
        _traversal(root, &nums)
    }
        
    @discardableResult
    private func _traversal(_ node:TreeNode, _ nums: inout [Int]) -> Bool {
        
        if let leftNode = node.left {
            if !_traversal(leftNode, &nums) {
                return false
            }
        }
        
        if let last = nums.last, last >= node.val {
            return false
        }
        nums.append(node.val)

        if let rightNode = node.right {
            if !_traversal(rightNode, &nums) {
                return false
            }
        }
        return true
    }
}

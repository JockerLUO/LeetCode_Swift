//
//  144_Binary_Tree_Preorder_Traversal.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/7/11.
//

import Foundation

extension Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var nums = [Int]()
        var stack = [TreeNode]()

        var curr: TreeNode? = root
        while curr != nil {
            if let right = curr?.right {
                stack.append(right)
            }
            nums.append(curr!.val)
            if let left = curr?.left {
                curr = left
            } else {
                curr = stack.popLast()
            }
        }
        return nums
    }
}

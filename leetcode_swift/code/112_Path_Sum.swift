//
//  112_Path_Sum.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/19.
//

import Foundation

extension Solution {
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if root == nil {
            return false
        }
        let val = root!.val
        if root?.left == nil, root?.right == nil {
            return val == targetSum
        }
        return hasPathSum(root?.left, targetSum - val) || hasPathSum(root?.right, targetSum - val)
    }
}

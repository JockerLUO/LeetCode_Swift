//
//  107_Binary_Tree_Level_Order_Traversal_II.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/9.
//

import Foundation

extension Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {

        var res = [[Int]]()
        guard let root = root else {
            return res
        }
        var nextNodes = [root]
        while !nextNodes.isEmpty {
            let count = nextNodes.count
            var nodes = [TreeNode]()
            var nums = [Int]()
            for i in 0..<count {
                let node = nextNodes[i]
                nums.append(node.val)
                if let left = node.left {
                    nodes.append(left)
                }
                if let right = node.right {
                    nodes.append(right)
                }
            }
            nextNodes = nodes
            res.append(nums)
        }
        return res.reversed()
    }
}

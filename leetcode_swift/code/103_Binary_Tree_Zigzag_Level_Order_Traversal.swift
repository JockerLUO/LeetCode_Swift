//
//  103_Binary_Tree_Zigzag_Level_Order_Traversal.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/9.
//

import Foundation

extension Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        guard let root = root else {
            return res
        }
        var nextNodes = [root]
        var flag = false
        while !nextNodes.isEmpty {
            let count = nextNodes.count
            var nodes = [TreeNode]()
            var nums = [Int]()
            for i in 0..<count {
                let node = nextNodes[i]
                if flag {
                    nums.insert(node.val, at: 0)
                } else {
                    nums.append(node.val)
                }
                if let left = node.left {
                    nodes.append(left)
                }
                if let right = node.right {
                    nodes.append(right)
                }
            }
            nextNodes = nodes
            res.append(nums)
            flag.toggle()
        }
        return res
    }
}

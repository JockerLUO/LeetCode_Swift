//
//  101_Symmetric_Tree.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/9.
//

import Foundation

extension Solution {

    //按层级遍历
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root?.left?.val != root?.right?.val {
            return false
        }

        var nextNodes = [root?.left, root?.right]
        while !nextNodes.isEmpty {
            let count = nextNodes.count
            var nodes = [TreeNode?]()
            for i in 0..<count / 2 {
                let index = count / 2 - 1 - i
                let lNode = nextNodes[index]
                let rNode = nextNodes[count - 1 - index]

                if lNode?.right?.val != rNode?.left?.val {
                    return false
                } else if lNode?.right != nil {
                    nodes.insert(lNode?.right, at: 0)
                    nodes.append(rNode?.left)
                }

                if lNode?.left?.val != rNode?.right?.val {
                    return false
                } else if lNode?.left != nil {
                    nodes.insert(lNode?.left, at: 0)
                    nodes.append(rNode?.right)
                }
            }
            nextNodes = nodes
        }
        return true
    }
}

//
//  145_Binary_Tree_Postorder_Traversal.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/7/11.
//

import Foundation

extension Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var nums = [Int]()
        var pre: TreeNode?
        var curr: TreeNode?
        var stack: [TreeNode] = []
        curr = root
        while curr != nil {
            var flag = false ///是否需要回溯上一层节点
            if curr?.left == nil, curr?.right == nil {
                flag = true
            }
            if pre != nil, curr?.right === pre {
                flag = true
            }
            if pre != nil, curr?.left === pre, curr?.right == nil {
                flag = true
            }
            if flag {
                pre = curr
                nums.append(curr!.val)
                curr = stack.popLast()
            } else {
                var temp: TreeNode?
                if let node = curr?.left, node !== pre { //左节点未遍历过
                    stack.append(curr!)
                    temp = node
                }
                if let node = curr?.right, temp === nil { //左节点不需要遍历,遍历右节点
                    stack.append(curr!)
                    temp = node
                }
                curr = temp
            }
        }
        
        return nums
    }
}

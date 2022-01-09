//
//  105_Construct_Binary_Tree_from_Preorder_and_Inorder_Traversal.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/9.
//

import Foundation

extension Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.isEmpty {
            return nil
        }
        let mid = preorder[0]
        let root = TreeNode(mid)
        let count = inorder.count
        if count == 1 {
            return root
        }
        
        var index = 0
        for i in 0..<count {
            if inorder[i] == mid {
                index = i
            }
        }
        if index > 0 {
            root.left = buildTree(Array(preorder[1...index]), Array(inorder[..<index]))
        }
        if index < count - 1 {
            root.right = buildTree(Array(preorder[(index + 1)...]), Array(inorder[(index + 1)...]))
        }
        return root
    }
}

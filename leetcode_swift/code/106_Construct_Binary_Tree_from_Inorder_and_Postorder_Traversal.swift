//
//  106_Construct_Binary_Tree_from_Inorder_and_Postorder_Traversal.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/9.
//

import Foundation

extension Solution {
    func buildTree_II(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        return _buildTree_II(inorder, postorder)
    }
    
    private func _buildTree_II(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        if postorder.isEmpty {
            return nil
        }
        let mid = postorder[postorder.count - 1]
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
            root.left = _buildTree_II(Array(inorder[..<index]), Array(postorder[..<index]))
        }
        if index < count - 1 {
            root.right = _buildTree_II(Array(inorder[(index + 1)...]), Array(postorder[index..<(count - 1)]))
        }
        return root
    }
}

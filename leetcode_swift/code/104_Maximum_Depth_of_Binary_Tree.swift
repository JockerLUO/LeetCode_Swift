//
//  104_Maximum_Depth_of_Binary_Tree.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/9.
//

import Foundation

extension Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        Self.maxDepth = 0
        _maxDepth(root, 0)
        return Self.maxDepth
    }
    
    private static var maxDepth: Int = 0
    private func _maxDepth(_ node: TreeNode?, _ depth: Int) {
        guard let node = node else {
            return
        }
        let cDepth = depth + 1
        Self.maxDepth = max(cDepth, Self.maxDepth)
        
        _maxDepth(node.left, cDepth)
        _maxDepth(node.right, cDepth)
    }
}

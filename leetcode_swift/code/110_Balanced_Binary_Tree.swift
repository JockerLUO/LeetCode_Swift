//
//  110_Balanced_Binary_Tree.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/19.
//

import Foundation

extension Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        return _height(root) >= 0
    }
    
    private func _height(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let lh = _height(root?.left)
        let rh = _height(root?.right)
        if lh > 0, rh > 0, abs(lh - rh) <= 1 {
            return max(lh, rh) + 1
        } else {
            return -1
        }
    }
}

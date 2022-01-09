//
//  100_Same_Tree.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/9.
//

import Foundation

extension Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {

        guard let p = p, let q = q else {
            if p == nil, q == nil {
                return true
            } else {
                return false
            }
        }
        if p.val != q.val {
            return false
        }
        return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }
    
}

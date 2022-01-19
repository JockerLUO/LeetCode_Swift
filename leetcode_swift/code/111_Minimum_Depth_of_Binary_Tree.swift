//
//  111_Minimum_Depth_of_Binary_Tree.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/19.
//

import Foundation

extension Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let ld = minDepth(root?.left)
        let rd = minDepth(root?.right)
        if ld * rd != 0 {
            return min(ld, rd) + 1
        } else if ld != 0 || rd != 0 {
            return max(ld, rd) + 1
        } else {
            return 1
        }
    }
}

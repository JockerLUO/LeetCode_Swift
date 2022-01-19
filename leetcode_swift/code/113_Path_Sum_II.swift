//
//  113_Path_Sum_II.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/19.
//

import Foundation

extension Solution {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        if root == nil {
            return []
        }
        let val = root!.val
        if root?.left == nil, root?.right == nil {
            return val == targetSum ? [[val]] : []
        }
        var res = [[Int]]()
        let resL = pathSum(root?.left, targetSum - val)
        for re in resL {
            res.append([val] + re)
        }
        
        let resR = pathSum(root?.right, targetSum - val)
        for re in resR {
            res.append([val] + re)
        }
        return res
    }
}

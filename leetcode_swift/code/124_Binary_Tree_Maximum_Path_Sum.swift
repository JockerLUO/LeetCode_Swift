//
//  124_Binary_Tree_Maximum_Path_Sum.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/2/7.
//

import Foundation

extension Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let res = _maxPathSum(root)
        return max(res.0, res.1)
    }

    private func _maxPathSum(_ root: TreeNode?) -> (Int, Int) {
        guard let root = root else {
            return (-1001, -1000)
        }
        let leftRes = _maxPathSum(root.left)
        let rightRes = _maxPathSum(root.right)
        let val = root.val
        
        let linkPath = [
            val,
            leftRes.0 + val,
            rightRes.0 + val,
        ] ///可链接的最大值
        
        let unliknPath = [
            leftRes.0,
            leftRes.1,
            rightRes.0,
            rightRes.1,
            leftRes.0 + rightRes.0 + val,
        ] ///不可链接的最大值
        return (linkPath.max()!, unliknPath.max()!)
    }
}

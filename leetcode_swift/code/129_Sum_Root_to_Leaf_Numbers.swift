//
//  129_Sum_Root_to_Leaf_Numbers.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/2/9.
//

import Foundation

extension Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
        Self.numbers = []
        _sumNumbers(root, [])
        var res = 0
        for num in Self.numbers {
            res += num
        }
        return res
    }
    
    private static var numbers: [Int] = []
    private func _sumNumbers(_ node: TreeNode?, _ nums: [Int]) {
        guard let node = node else {
            return
        }
        var numsC = nums
        numsC.append(node.val)
        if node.left == nil, node.right == nil {
            var res = 0
            for num in numsC {
                res = res * 10 + num
            }
            Self.numbers.append(res)
        } else {
            _sumNumbers(node.left, numsC)
            _sumNumbers(node.right, numsC)
        }
    }

}

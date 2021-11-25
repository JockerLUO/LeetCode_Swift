//
//  090_Subsets_II.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/25.
//

import Foundation

extension Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        return _subsetsWithDup(nums.sorted())
    }

    
    private func _subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty {
            return [[]]
        }
        
        let count = nums.count
        var len = 1
        let num = nums[count - 1]
        if nums.count > 1 {
            var n = count - 2
            while n >= 0, nums[n] == num {
                n -= 1
                len += 1
            }
        }
        
        var res = [[Int]]()
        let ls = subsetsWithDup(Array(nums[0..<count - len]))
        res += ls
        
        for l in ls {
            for j in 0..<len {
                res.append((l + Array(repeating: num, count: j + 1)))
            }
        }
        return res
    }
}

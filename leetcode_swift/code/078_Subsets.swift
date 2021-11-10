//
//  078_Subsets.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/10.
//

import Foundation

extension Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty {
            return [[]]
        }
        let count = nums.count
        var res = [[Int]]()
        let ls = subsets(Array(nums[0..<count - 1]))
        res += ls
        for l in ls {
            var l = l
            l.append(nums[count - 1])
            res.append(l)
        }
        return res
    }
}

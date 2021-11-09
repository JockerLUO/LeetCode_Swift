//
//  053_Maximum_Subarray.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/1.
//

import Foundation

extension Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var result = nums[0]
        var curr = nums[0]
        for i in 1..<nums.count {
            curr = nums[i] + max(curr, 0)
            result = max(curr, result)
        }
        return result
    }
}

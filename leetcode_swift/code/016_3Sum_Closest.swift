//
//  016_3Sum_Closest.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/26.
//

import Foundation

extension Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 3 else {
            return nums.reduce(0, +)
        }
        let nums = nums.sorted()
        var res = nums[0] + nums[1] + nums[2]
        
        for (i, _) in nums.enumerated() {
            if i > 0, nums[i] == nums[i - 1] {
                continue
            }
            var j = i + 1
            var k = nums.count - 1
            while j < k {
                let curr = nums[i] + nums[j] + nums[k]
                if curr == target {
                    return target
                } else if curr < target {
                    j += 1
                } else {
                    k -= 1
                }
                if (abs(curr - target) < abs(res - target)) {
                    res = curr
                }
            }
        }
        return res
    }
}

//
//  015_3Sum.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/24.
//

import Foundation

extension Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        let nums = nums.sorted()
        
        for (i, _) in nums.enumerated() {
            if i > 0, nums[i] == nums[i - 1] {
                continue
            }
            var j = i + 1
            var k = nums.count - 1
            while j < k {
                let curr = nums[i] + nums[j] + nums[k]
                if curr == 0 {
                    res.append([nums[i], nums[j], nums[k]])
                    while j < k, nums[j] == nums[j + 1] {
                        j += 1
                    }
                    while j < k, nums[k] == nums[k - 1] {
                        k -= 1
                    }
                    j += 1
                    k -= 1
                } else if curr < 0 {
                    j += 1
                } else {
                    k -= 1
                }
            }
        }
        return res
    }
}

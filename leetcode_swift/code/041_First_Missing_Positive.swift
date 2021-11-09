//
//  041_First_Missing_Positive.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/10/13.
//

import Foundation

extension Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
    
        let ls = nums.count
        var index = 0
        while index < ls {
            let num = nums[index]
            if num <= 0 ||
                num > ls ||
                num == nums[num - 1] {
                index += 1
            } else {
                let pos = num - 1
                nums[index] = nums[pos]
                nums[pos] = num
            }
        }
        var res = 0
        while res < ls, nums[res] == res + 1 {
            res += 1
        }
        return res + 1
    }
}

//
//  055_Jump_Game.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/4.
//

import Foundation

extension Solution {
    func canJump(_ nums: [Int]) -> Bool {
        
        if nums.count == 1 {
            return true
        }
        if nums[0] == 0 {
            return false
        }
        var ls = Array(repeating: -1, count: nums.count)
        ls[0] = 0
        for (i, num) in nums.enumerated() {
            guard num > 0 else {
                continue
            }
            var j = min(ls.count - 1, (i + num))
            repeat {
                if ls[j] == -1 {
                    if j == i {
                        return false
                    }
                    ls[j] = i
                    j -= 1
                } else {
                    break
                }
            } while j >= (i + 1)
        }

        var flag = true
        var curr = nums.count - 1
        while curr != 0 {
            let index = ls[curr]
            if index == -1 {
                flag = false
                break
            }
            curr -= 1
        }
        return flag
    }
}

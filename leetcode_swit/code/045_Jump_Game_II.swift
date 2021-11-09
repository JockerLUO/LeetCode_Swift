//
//  045_Jump_Game_II.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/10/20.
//

import Foundation

extension Solution {
    func jump(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return 0
        }
        var ls = Array(repeating: -1, count: nums.count)
        ls[0] = 0
    loop: for (i, num) in nums.enumerated() {
        guard num > 0 else {
            continue
        }
        var j = min(ls.count - 1, (i + num))
        repeat {
            if ls[j] == -1 {
                ls[j] = i
                if j == nums.count - 1 {
                    break loop
                }
                j -= 1
            } else {
                break
            }
        } while j >= (i + 1)
        if ls[nums.count - 1] != -1 {
            break
        }
    }
        var res = 0
        var curr = nums.count - 1
        while curr != 0 {
            curr = ls[curr]
            res += 1
        }
        return res
    }
}

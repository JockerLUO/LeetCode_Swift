//
//  066_Plus_One.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/8.
//

import Foundation

extension Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var res = digits
        var index = res.count - 1
        while index >= 0 {
            if res[index] < 9 {
                res[index] += 1
                break
            } else {
                res[index] = 0
                index -= 1
            }
        }
        if index == -1, res[0] == 0 {
            res.insert(1, at: 0)
        }
        return res
    }
}

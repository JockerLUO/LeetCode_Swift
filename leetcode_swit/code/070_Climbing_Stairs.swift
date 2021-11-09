//
//  070_Climbing_Stairs.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/8.
//

import Foundation

extension Solution {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }
        var res = Array(repeating: 0, count: n + 1)
        res[0] = 1
        res[1] = 1
        for i in 2...n {
            res[i] = res[i - 1] + res[i - 2]
        }
        return res[n]
    }
}

//
//  062_Unique_Paths.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/8.
//

import Foundation

extension Solution {
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        let ls = Array(repeating: 0, count: n)
        var dp = Array(repeating: ls, count: m)
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 || j == 0 {
                    dp[i][j] = 1
                } else {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                }
            }
        }
        return dp[m - 1][n - 1]
    }
    
    //    func uniquePaths(_ m: Int, _ n: Int) -> Int {
    //        var res = 0
    //        if m == 1 {
    //            res = 1
    //        } else {
    //            for i in 0..<n {
    //                res += uniquePaths(m - 1, n - i)
    //            }
    //        }
    //        return res
    //    }
}

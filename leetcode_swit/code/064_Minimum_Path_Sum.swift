//
//  064_Minimum_Path_Sum.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/8.
//

import Foundation

extension Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        
        let m = grid.count
        let n = grid[0].count
        
        let ls = Array(repeating: 0, count: n)
        var dp = Array(repeating: ls, count: m)
        for i in 0..<m {
            for j in 0..<n {
                let num = grid[i][j]
                if i == 0, j == 0 {
                    dp[i][j] = num
                } else if i == 0 {
                    dp[i][j] = dp[i][j - 1] + num
                } else if j == 0 {
                    dp[i][j] = dp[i - 1][j] + num
                } else {
                    dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + num
                }
            }
        }
        return dp[m - 1][n - 1]
        
    }
}

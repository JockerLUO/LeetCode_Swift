//
//  063_Unique_Paths_II.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/8.
//

import Foundation

extension Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        
        let m = obstacleGrid.count
        let n = obstacleGrid[0].count
        
        let ls = Array(repeating: 0, count: n)
        var dp = Array(repeating: ls, count: m)
        for i in 0..<m {
            for j in 0..<n {
                if obstacleGrid[i][j] == 1 {
                    dp[i][j] = 0
                } else if i == 0, j == 0 {
                    dp[i][j] = 1
                } else if i == 0 {
                    dp[i][j] = dp[i][j - 1]
                } else if j == 0 {
                    dp[i][j] = dp[i - 1][j]
                } else {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                }
            }
        }
        return dp[m - 1][n - 1]
    }
}

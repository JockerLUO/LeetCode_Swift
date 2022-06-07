//
//  130_Surrounded_Regions.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/2/9.
//

import Foundation

extension Solution {
    func solve(_ board: inout [[Character]]) {
        guard !board.isEmpty else {
            return
        }
        let m = board.count, n = board[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                let chr = board[i][j]
                guard chr == "O" else {
                    continue
                }
                if (i == 0 || i == m - 1 || j == 0 || j ==  n - 1) //在边界上
                    || (dp[i - 1][j] == -1 || dp[i][j - 1] == -1) { //附件有相连的出口
                    dp[i][j] = 1
                    dfs(&dp, i, j)
                } else {
                    dp[i][j] = 1
                }
            }
        }
        
        for i in 0..<m {
            for j in 0..<n {
                if dp[i][j] == 1 {
                    board[i][j] = "X"
                }
            }
        }
    }
    
    private func dfs(_ dp: inout [[Int]], _ i: Int, _ j: Int) {
        let m = dp.count, n = dp[0].count
        guard i >= 0, i < m, j >= 0, j < n, dp[i][j] == 1 else {
            return
        }
        dp[i][j] = -1
        dfs(&dp, i - 1, j)
        dfs(&dp, i + 1, j)
        dfs(&dp, i, j - 1)
        dfs(&dp, i, j + 1)
    }
}

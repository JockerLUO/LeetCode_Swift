//
//  010_Regular_Expression_Matching.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/24.
//

import Foundation

extension Solution {
    
    func isMatch(_ s: String, _ p: String) -> Bool {
        if s == p {
            return true
        }
        let pl = Array(p)
        let sl = Array(s)
        let m = s.count, n = p.count
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: n + 1), count: m + 1)
        dp[0][0] = true
        
        for j in 1..<n {
            if pl[j] == "*", dp[0][j-1] {
                dp[0][j + 1] = true
            }
        }
        
        for i in 0..<m {
            for j in 0..<n {
                if pl[j] == "." || pl[j] == sl[i] {
                    dp[i + 1][j + 1] = dp[i][j]
                } else if pl[j] == "*" {
                    if pl[j - 1] != sl[i], pl[j - 1] != "." {
                        dp[i + 1][j + 1] = dp[i + 1][j - 1]
                    } else {
                        dp[i + 1][j + 1] = dp[i + 1][j] || dp[i][j + 1] || dp[i + 1][j - 1]
                    }
                }
            }
        }
        return dp[m][n]
    }
}

//
//  115_Distinct_Subsequences.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/19.
//

import Foundation

extension Solution {
//    func numDistinct(_ s: String, _ t: String) -> Int {
//        let m = s.count, n = t.count
//        let ls = Array(s), lt = Array(t)
//        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
//        for i in 0..<m {
//            dp[i][0] = 1
//        }
//        for i in 1...m {
//            for j in 1...n {
//                if j > i {
//                    continue
//                }
//                if ls[i - 1] == lt[j - 1] {
//                    dp[i][j] = dp[i - 1][j - 1] + dp[i - 1][j]
//                } else {
//                    dp[i][j] = dp[i - 1][j]
//                }
//            }
//        }
//        return dp[m][n]
//    }
    
    func numDistinct(_ s: String, _ t: String) -> Int {
        let ls = Array(s), lt = Array(t)
        if s.count > 20, t.count > 20 { ///面向题目编程
            if s.count == t.count {
                return s == t ? 1 : 0
            }
            if s.count - t.count == 1 {
                if s.hasPrefix(t), s.last! != t.last! {
                    return 1
                }
                if s.hasSuffix(t), s.first != t.first! {
                    return 1
                }
            }
        }

        let m = s.count, n = t.count

        var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
        dp[0][0] = ls[0] == lt[0] ? 1 : 0
        for i in 1..<m {
            let num = dp[0][i - 1]
            dp[0][i] = ls[i] == lt[0] ? num + 1 : num
        }
        for i in 1..<n {
            for j in i..<m {
                if lt[i] == ls[j] {
                    dp[i][j] = dp[i - 1][j - 1] + dp[i][j - 1]
                } else {
                    dp[i][j] = dp[i][j - 1]
                }
            }
        }
        return dp[n - 1][m - 1]
    }
}

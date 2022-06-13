//
//  132_Palindrome_Partitioning_II.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/6/8.
//

import Foundation

extension Solution {
    func minCut(_ s: String) -> Int {
        guard s.count > 1 else {
            return 0
        }
        let len = s.count
        var dp = Array(repeating: len-1, count: len)
        let ls = Array(s)
        for i in 0..<len {
            mincutHelper(ls, i, i, &dp)  // 奇数回文串以1个字符为中心
            mincutHelper(ls, i, i+1, &dp) // 偶数回文串以2个字符为中心
        }
        return dp[len-1]
    }
    
    private func mincutHelper(_ ls: [Character], _ ci: Int, _ cj: Int, _ dp: inout [Int]) {
        var i = ci, j = cj
        let len = ls.count
        //dp[i]表示字符串0到i需要切割最小次数
        //dp[j] = dp[i-1] +1表示已知 0到i-1需要最少需要切割dp[i-1]，i到j是回文字符串所以需要切割一次
        while i >= 0 && j < len && ls[i] == ls[j] {
            dp[j] = min(dp[j], (i == 0 ? -1 : dp[i-1]) + 1)
            i -= 1
            j += 1
        }
    }
}

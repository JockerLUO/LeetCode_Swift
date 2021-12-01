//
//  096_Unique_Binary_Search_Trees.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/30.
//

import Foundation

extension Solution {
    func numTrees(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n+1)
        dp[0] = 1
        dp[1] = 1
        for i in 2..<(n + 1) {
            for j in 1..<(i + 1) {
                dp[i] += dp[j-1] * dp[i-j]
            }
        }
        return dp[n]
    }
    
//    private func get_treesNum(_ start: Int, _ end: Int) -> Int {
//        var res = 0
//        if start > end {
//            return 1
//        }
//        
//        for i in start...end {
//            let j = get_treesNum(start, i - 1)
//            let k = get_treesNum(i + 1, end)
//            res += (j * k)
//        }
//        return res
//    }
}

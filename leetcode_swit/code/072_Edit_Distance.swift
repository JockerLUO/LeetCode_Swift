//
//  072_Edit_Distance.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/8.
//

import Foundation

/*
 https://leetcode-cn.com/problems/edit-distance/comments/
 */

extension Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1 == word2 {
            return 0
        }
        if word1.count == 0 || word2.count == 0 {
            return max(word1.count, word2.count)
        }
        let m = word1.count, n = word2.count
        let ls = Array(repeating: 0, count: n + 1)
        var cost = Array(repeating: ls, count: m + 1)
        
        for i in 0...m {
            cost[i][0] = i
        }
        for j in 0...n {
            cost[0][j] = j
        }
        
        let wls1 = Array(word1), wls2 = Array(word2)
        
        for i in 1...m {
            for j in 1...n {
                if (wls1[i-1] == wls2[j-1]) {
                    cost[i][j] = cost[i-1][j-1]
                } else {
                    cost[i][j] = 1 + min(cost[i-1][j-1], min(cost[i][j-1], cost[i-1][j]));
                }
            }
        }
        return cost[m][n]
    }
}

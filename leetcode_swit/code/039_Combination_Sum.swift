//
//  039_Combination_Sum.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/10/12.
//

import Foundation

extension Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        
        let candidatesC = candidates.sorted()
        var dp = Array(repeating: [[Int]](), count: target + 1)
        dp[0].append([])
        
        for i in 1...target {
            for j in 0..<candidatesC.count {
                if candidatesC[j] > i {
                    break
                }
                for k in 0..<dp[i - candidatesC[j]].count {
                    var temp = dp[i - candidatesC[j]][k]
                    if temp.count > 0,  ///避免为空
                        temp.last! > candidatesC[j] { ///避免值是一个更小值
                        continue
                    }
                    temp.append(candidatesC[j]) /// 打印dp可知,根据之前的结果,动态规划
                    dp[i].append(temp)
                }
            }
        }
        return dp[target]
    }
}

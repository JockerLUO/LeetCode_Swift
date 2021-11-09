//
//  040_Combination_Sum_II.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/10/12.
//

import Foundation

extension Solution {

    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {

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
                    if temp.count > 0 {
                        let lastVal = temp.last!
                        if (lastVal >= j) {
                            continue
                        }
                        if candidatesC[lastVal] == candidatesC[j], j - lastVal != 1 { ///避免重复
                            continue
                        }
                    }
                    temp.append(j)
                    dp[i].append(temp)
                }
            }
        }
        let result = dp[target].map { $0.map { candidatesC[$0] } }
        return result.enumerated().filter { result.firstIndex(of: $0.1) == $0.0 }.map { $0.1 }
    }
}

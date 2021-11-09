//
//  047_Permutations_II.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/10/26.
//

import Foundation

extension Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty {
            return []
        }
        let numsC = nums.sorted(by: < )
        if numsC.first == numsC.last {
            return [nums]
        }
        var res = [[numsC[0]]]
        for i in 1..<numsC.count {
            let num = numsC[i]
            var ls = [[Int]]()
            for rs in res {
                for j in 0...rs.count {
                    if j > 1, num == rs[j - 1] {
                        continue
                    }
                    var js = rs
                    js.insert(num, at: j)
                    if !ls.contains(js) {
                        ls.append(js)
                    }
                }
            }
            res = ls
        }
        return res
    }
}

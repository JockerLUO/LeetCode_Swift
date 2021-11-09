//
//  046_Permutations.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/10/25.
//

import Foundation

extension Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty {
            return []
        }
        var res = [[nums[0]]]
        for i in 1..<nums.count {
            let num = nums[i]            
            var ls = [[Int]]()
            for rs in res {
                for j in 0...rs.count {
                    var js = rs
                    js.insert(num, at: j)
                    ls.append(js)
                }
            }
            res = ls
        }
        return res
    }
    
}

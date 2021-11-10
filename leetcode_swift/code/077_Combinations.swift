//
//  077_Combinations.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/10.
//

import Foundation

extension Solution {
    
    //提示: C(m,n) = C(m-1,n) + C(m-1,n-1) * m
    func combine(_ n: Int, _ k: Int) -> [[Int]] {

        if k > n || k == 0 {
            return []
        } else if k == 1 {
            return Array(1...n).map { [$0] }
        } else if k == n {
            return [Array(1...n)]
        }
        
        var res = combine(n - 1, k)
        for ls in combine(n - 1, k - 1) {
            var ls = ls
            ls.append(n)
            res.append(ls)
        }
        return res
    }
}

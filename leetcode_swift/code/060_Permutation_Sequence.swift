//
//  060_Permutation_Sequence.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/5.
//

import Foundation

extension Solution {
    
    ///康托展开
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var res = [Int]()
        var num = k - 1
        var ls = Array(1...n)
        
        while !ls.isEmpty {
            
            let a = mul(ls.count - 1)
            let temp = num / a
            
            res.append(ls[temp])
            ls.remove(at: temp)
//            print(num, a, temp, res, ls)

            num = num % a
        }
        return res.map { String($0) }.joined()
    }
    
    private func mul(_ n: Int) -> Int {
        let factor = [1,1,2,6,24,120,720,5040,40320,362880]
        return factor[n]
        
//        if n <= 1 {
//            return 1
//        } else {
//            return n * mul(n-1)
//        }
    }
}

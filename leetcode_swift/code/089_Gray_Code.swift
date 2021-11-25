//
//  089_Gray_Code.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/25.
//

import Foundation

extension Solution {
    func grayCode(_ n: Int) -> [Int] {
        if n == 1 {
            return [0 , 1]
        }
        let ls = grayCode(n - 1)
        
        var res = [Int]()
        ls.forEach { num in
            res.append(num * 2)
        }
        ls.reversed().forEach { num in
            res.append(num * 2 + 1)
        }
        return res
    }
}

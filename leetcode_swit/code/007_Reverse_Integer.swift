//
//  007_Reverse_Integer.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/24.
//

import Foundation

extension Solution {
    func reverse(_ x: Int) -> Int {
        let isPos = x > 0 ? 1 : -1
        var temp = x * isPos
        var res = 0
        while temp > 0 {
            res = res * 10 + temp % 10
            if res >= Int32.max {
                return 0
            }
            temp = temp / 10
        }
        return res * isPos
    }
}

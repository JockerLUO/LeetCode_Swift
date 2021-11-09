//
//  058_Length_of_Last_Word.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/5.
//

import Foundation

extension Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var res = 0
        let ls = Array(s)
        var i = s.count - 1
        repeat {
            let char = ls[i]
            if char == " " {
                if res != 0 {
                    break
                }
            } else {
                res += 1
            }
            i -= 1
        } while i >= 0
        return res
    }
}

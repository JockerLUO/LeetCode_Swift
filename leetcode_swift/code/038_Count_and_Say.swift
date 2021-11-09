//
//  038_Count_and_Say.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/10/12.
//

import Foundation

extension Solution {
    func countAndSay(_ n: Int) -> String {
        var offset = 1
        var preS = "1"
        while offset < n {
            preS = sayCount(preS)
            offset += 1
        }
        return preS
    }
    
    private func sayCount(_ s: String) -> String {
        guard !s.isEmpty else {
            return s
        }
        let ls = Array(s)
        var res = ""
        var preChar: Character = ls[0]
        var count = 0
        for char in ls {
            if char != preChar {
                res.append("\(count)\(preChar)")
                preChar = char
                count = 0
            }
            count += 1
        }
        res.append("\(count)\(preChar)")
        return res
    }
}

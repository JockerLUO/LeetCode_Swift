//
//  013_Roman_to_Integer.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/24.
//

import Foundation

extension Solution {
    private static let romanMap: [Character: Int] = [
        "M": 1000,
        "D": 500,
        "C": 100,
        "L": 50,
        "X": 10,
        "V": 5,
        "I": 1,
    ]
    
    func romanToInt(_ s: String) -> Int {
        var res = 0
        let ls = Array(s)
        var prev = 0
        for char in ls {
            if let num = Self.romanMap[char] {
                res += num
                if num > prev {
                    res -= 2 * prev
                }
                prev = num
            }
        }
        return res
    }
}

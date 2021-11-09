//
//  012_Integer_to_Roman.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/24.
//

import Foundation

extension Solution {
    private static let romanMap: [(Int, String)] = [
        (1000, "M"),
        (900 , "CM"),
        (500 , "D"),
        (400 , "CD"),
        (100 , "C"),
        (90  , "XC"),
        (50  , "L"),
        (40  , "XL"),
        (10  , "X"),
        (9   , "IX"),
        (5   , "V"),
        (4   , "IV"),
        (1   , "I"),
    ]

    func intToRoman(_ num: Int) -> String {
        var roman = [String]()
        var num = num
        
        var offset = 0
        while num > 0 {
            let value = Self.romanMap[offset]
            if num >= value.0 {
                let n = num / value.0
                for _ in 0..<n {
                    roman.append(value.1)
                }
                num = num % value.0
            }
            offset += 1
        }
        return roman.joined()
    }
}

//
//  032_Longest_Valid_Parentheses.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/10/8.
//

import Foundation

extension Solution {
    func longestValidParentheses(_ s: String) -> Int {
        let ls = Array(s)
        let longest = longestValid(ls: ls, lChar: "(", rChar: ")")
        let reversedlongest = longestValid(ls: ls.reversed(), lChar: ")", rChar: "(")
        return max(longest, reversedlongest)
    }
    
    private func longestValid(ls: [Character], lChar: Character, rChar: Character) -> Int {
//        print(ls)
        var longest = 0
        
        var left = 0
        var rigth = 0
        var count = 0
        
        for (i, char) in ls.enumerated() {
            rigth += 1
            if char == lChar {
                count += 1
            } else if char == rChar {
                if count > 0 {
                    count -= 1
                } else {
                    left = i + 1
                }
            }
            let def = rigth - left
            if count == 0 {
                longest = max(longest, def)
            }
//            print(i, char, longest, count, left, rigth)
        }
        return longest
    }
}

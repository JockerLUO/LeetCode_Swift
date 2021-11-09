//
//  020_Valid_Parentheses.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/26.
//

import Foundation

extension Solution {
    private static let signMap: [Character: Character] = [
        "(": ")",
        "{": "}",
        "[": "]",
    ]
    
    private static let signL: [Character] = [
        "(",
        "{",
        "[",
    ]

    private static let signR: [Character] = [
        ")",
        "}",
        "]",
    ]
    
    func isValid(_ s: String) -> Bool {
        guard !s.isEmpty else {
            return false
        }
        
        let ls = Array(s)
        var stack = [Character]()
        for char in ls {
            if Self.signL.contains(char) {
                stack.append(char)
            } else {
                if stack.count == 0 {
                    return false
                }
                if char == Self.signMap[stack.last!] {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }
        return stack.count == 0
    }
}

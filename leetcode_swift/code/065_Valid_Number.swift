//
//  065_Valid_Number.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/8.
//

import Foundation

extension Solution {
    func isNumber(_ s: String) -> Bool {
        
        var hasPoint = false, hasExponent = false, hasNumber = false
        let s = Array(s.trimmingCharacters(in: .whitespaces))
        
        for (i, char) in s.enumerated() {
            if char.isNumber {
                hasNumber = true
            } else if char == "e" || char == "E" {
                if hasExponent || i == s.count - 1 || !hasNumber {
                    return false
                } else {
                    hasExponent = true
                }
            } else if char == "." {
                if hasPoint || hasExponent {
                    return false
                } else {
                    hasPoint = true
                }
            } else if char == "+" || char == "-" {
                if i != 0 && (s[i - 1] != "e" || i == s.count - 1) {
                    return false
                }
            } else {
                return false
            }
        }
        
        // s could be made up of all white spaces or all symbols
        return hasNumber
    }
}

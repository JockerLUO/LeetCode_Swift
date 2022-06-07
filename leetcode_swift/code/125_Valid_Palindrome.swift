//
//  125_Valid_Palindrome.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/2/8.
//

import Foundation

extension Solution {
    func isPalindrome(_ s: String) -> Bool {
        var chars = [Character]()
        for char in s {
            if let asc = char.asciiValue {
                if  (48...57).contains(asc) {
                    chars.append(char)
                } else if (65...90).contains(asc) {
                    chars.append(Character(UnicodeScalar(asc + 32)))
                } else if (97...122).contains(asc) {
                    chars.append(char)
                }
            }
        }
        if chars.isEmpty {
            return true
        }
        for i in 0..<(chars.count / 2) {
            if chars[i] != chars[chars.count - 1 - i] {
                return false
            }
        }
        return true
    }
}

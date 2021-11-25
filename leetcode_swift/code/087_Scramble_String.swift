//
//  087_Scramble_String.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/23.
//

import Foundation

extension Solution {
    func isScramble(_ s1: String, _ s2: String) -> Bool {
        guard s1.count == s2.count else {
            return false
        }
        let ls1 = Array(s1)
        let ls2 = Array(s2)
        guard ls1.sorted() == ls2.sorted() else {
            return false
        }
        var memo = [String: Bool]()
        return isScramble(ls1, ls2, &memo)
    }

    private func isScramble(_ s1: [Character], _ s2: [Character], _ memo: inout [String: Bool]) -> Bool {
        guard s1 != s2 else {
            return true
        }
        if s1.count == 1 {
            return s1 == s2
        }
        let key = String(s1 + s2)
        if memo[key] != nil {
            return memo[key]!
        }

        let n = s1.count
        for i in 1..<n {
            let ls1 = Array(s1[..<i])
            let rs1 = Array(s1[i...])
            
            let ls2 = Array(s2[..<i])
            let rs2 = Array(s2[i...])
            
            let ls3 = Array(s2[..<rs1.count])
            let rs3 = Array(s2[rs1.count...])

            if isScramble(ls1, ls2, &memo), isScramble(rs1, rs2, &memo) {
                memo[key] = true
                return true
            }
            if isScramble(rs1, ls3, &memo), isScramble(ls1, rs3, &memo) {
                memo[key] = true
                return true
            }
        }
        memo[key] = false
        return false
    }
    

//    func isScramble(_ s1: String, _ s2: String) -> Bool {
//        guard s1.count == s2.count else {
//            return false
//        }
//        guard s1 != s2 else {
//            return true
//        }
//        if s1.count == 1 {
//            return s1 == s2
//        }
//        Self.failMap.removeAll()
//        let res = isScramble(s1, s2, 0, s1.count - 1)
//        return res
//    }
//
//    private static var failMap = [String: Int]()
//
//    private func isScramble(_ s1: String, _ s2: String, _ left: Int, _ right: Int) -> Bool {
//        let key = "\(s1)_\(left)_\(right)"
//        if Self.failMap[key] != nil {
//            Self.failMap[key]! += 1
//            return false
//        }
//        Self.failMap[key] = 1
//
//        let len = right - left
//        if len == 0 {
//            return false
//        }
//        let ls = Array(s1)
//        let prefix = (left != 0) ? String(ls[0..<left]) : ""
//        let suffix = (right + 1 < ls.count) ? String(ls[(right + 1)...]) : ""
//        if len == 1 {
//            let leftStr = String(ls[left])
//            let rightStr = String(ls[right])
//            let res = prefix + rightStr + leftStr + suffix
//            return res == s2
//        }
//        for i in left..<right {
//            let leftStr = String(ls[left...i])
//            let rightStr = String(ls[(i + 1)...right])
//            let res = prefix + rightStr + leftStr + suffix
//
//            if res == s2 {
//                return true
//            } else {
//                if isScramble(s1, s2, left, i), isScramble(s1, s2, i, right) {
//                    return true
//                }
//                let mid = right + left - i - 1
//                if isScramble(res, s2, left, mid), isScramble(res, s2, mid + 1, right) {
//                    return true
//                }
//            }
//        }
//        return false
//    }
}

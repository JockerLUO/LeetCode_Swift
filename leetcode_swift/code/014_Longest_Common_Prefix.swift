//
//  014_Longest_Common_Prefix.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/24.
//

import Foundation

extension Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else {
            return ""
        }
        let s1 = strs.min()!
        let s2 = strs.max()!
        let ls1 = Array(s1)
        let ls2 = Array(s2)
        for (i,x) in ls1.enumerated() {
            if x != ls2[i] {
                return String(ls1[0..<i])
            }
        }
        return s1
    }

    
//    func longestCommonPrefix(_ strs: [String]) -> String {
//        guard !strs.isEmpty else {
//            return ""
//        }
//        guard Set(strs).count != 1 else {
//            return strs.first!
//        }
//        var res = [Character]()
//        for (i, char) in Array(strs.first!).enumerated() {
//            for s in strs {
//                if i >= s.count || Array(s)[i] != char {
//                    return String(res)
//                }
//            }
//            res.append(char)
//        }
//        return String(res)
//    }
}

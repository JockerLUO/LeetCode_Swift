//
//  005_Longest_Palindromic_Substring.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/23.
//

import Foundation

extension Solution {
    
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        
        let sChars = Array(s)
        var maxLen = 0, start = 0
        
        for i in 0..<sChars.count {
            searchPalindrome(sChars, i, i, &start, &maxLen)
            searchPalindrome(sChars, i, i + 1, &start, &maxLen)
        }
        
        return String(sChars[start..<start + maxLen])
    }
    
    private func searchPalindrome(_ chars: [Character], _ l: Int, _ r: Int, _ start: inout Int, _ maxLen: inout Int) {
        var l = l, r = r
        
        while l >= 0 && r < chars.count && chars[l] == chars[r] {
            l -= 1
            r += 1
        }
        
        if maxLen < r - l - 1 {
            start = l + 1
            maxLen = r - l - 1
        }
    }

    
//    func longestPalindrome(_ s: String) -> String {
//        let ls = s.count
//        if ls <= 1 || Set(s).count == 1 {
//            return s
//        }
//        let separation: Character = "#"
//        let temp_s = s.map { String($0) }.joined(separator: String(separation)).map {$0}
//        let tls = temp_s.count
//        var seed: [Int] = Array(1..<tls - 1)
//        var len_table = [Int](repeating: 0, count: tls)
//
//        for step in 1..<tls / 2 + 1 {
//            var final = [Int]()
//            for pos in seed {
//                if pos - step < 0 || pos + step >= tls {
//                    continue
//                }
//                if temp_s[pos - step] != temp_s[pos + step] {
//                    continue
//                }
//                final.append(pos)
//                if temp_s[pos - step] == separation {
//                    continue
//                }
//                len_table[pos] = step
//            }
//            seed = final
//        }
//        var max_pos = 0, max_step = 0
//        for (i, s) in len_table.enumerated() {
//            if s >= max_step {
//                max_step = s
//                max_pos = i
//            }
//        }
//        let result = temp_s[max_pos - max_step..<max_pos + max_step + 1].filter { $0 != separation }
//        return String(result)
//    }
}

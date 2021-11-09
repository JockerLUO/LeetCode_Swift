//
//  028_Implement_strStr().swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/28.
//

import Foundation

extension Solution {
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty, haystack != needle else {
            return 0
        }
        guard !haystack.isEmpty, haystack.count > needle.count else {
            return -1
        }
        
        let lsh = haystack.count, lsn = needle.count
        let next = self.makeNext(needle)
        
        let hl = Array(haystack)
        let nl = Array(needle)
        
        var i = 0, j = 0
        while i < lsh {
            if j == -1 || hl[i] == nl[j] {
                i += 1
                j += 1
                if j == lsn {
                    return i - lsn
                }
            }
            if i < lsh, hl[i] != nl[j] {
                j = next[j]
            }
        }
        return -1
    }
    
    private func makeNext(_ needle: String) -> [Int] {
        let ls = needle.count
        let nl = Array(needle)
        var next = [Int](repeating: 0, count: ls)
        next[0] = -1
        var i = 0, j = -1
        while i < ls - 1 {
            if j == -1 || nl[i] == nl[j] {
                next[i + 1] = j + 1
                if nl[i + 1] == nl[j + 1] {
                    next[i + 1] = next[j + 1]
                }
                i += 1
                j += 1
            }
            if nl[i] != nl[j] {
                j = next[j]
            }
        }
        return next
    }
}

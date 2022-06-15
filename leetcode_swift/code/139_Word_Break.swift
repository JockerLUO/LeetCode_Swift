//
//  139_Word_Break.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/6/14.
//

import Foundation

extension Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let len = s.count
        var dp = Array(repeating: false, count: len + 1)
        dp[0] = true
        var minlen = Int.max, maxlen = Int.min;
        for word in wordDict {
            minlen = min(minlen, word.count);
            maxlen = max(maxlen, word.count);
        }
        let ls = Array(s)

        for i in minlen...len {
            let left = max(i - maxlen, 0)
            for j in left..<i {
                let sub = String(ls[j..<i])
                if dp[j], wordDict.contains(sub) {
                    dp[i] = true
                    break
                }
            }
        }
        return dp[len]        
        
//        for i in 1..<len {
//            let sub = String(ls[...i])
//            dp[i] = wordDict.contains(sub)
//        }
//
//
//        if wordDict.contains(s) {
//            return true
//        }
//        if s.count <= 1 {
//            return wordDict.contains(s)
//        }
//        for i in 1..<ls.count {
//            let sub = String(ls[..<i])
//            if wordDict.contains(sub) {
//                let res = wordBreak(String(ls[i...]), wordDict)
//                if res {
//                    return res
//                }
//            }
//        }
//        return false
    }
}

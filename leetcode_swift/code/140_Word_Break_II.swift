//
//  140_Word_Break_II.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/6/14.
//

import Foundation

extension Solution {
    func wordBreak_II(_ s: String, _ wordDict: [String]) -> [String] {
        
        let len = s.count
        var dp = Array(repeating: [Int](), count: len + 1)
        dp[0] = [0]
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
                if !dp[j].isEmpty, wordDict.contains(sub) {
                    dp[i].append(j) ///标记哪个位置需要拆分
                }
            }
        }
        
        guard !dp[len].isEmpty else { return [] }
        
        //通过dp回溯构成index数组
        let pd = _wordBreak(dp, len)
        
//        for i in 0..<dp.count {
//            if !dp[i].isEmpty {
//                print(i, dp[i])
//            }
//        }
//        print(pd)
//        print(s)
            
        ///通过 pd 拆分成相应字符串
        var res = [String]()
        for p in pd {
            var re = [String]()
            if p.isEmpty {
                res.append(s)
                continue
            }
            for i in 0...p.count {
                if i == 0 {
                    re.append(String(ls[..<p[i]]))
                } else if i == p.count {
                    re.append(String(ls[(p[i - 1])...]))
                } else {
                    re.append(String(ls[(p[i - 1])..<p[i]]))
                }
            }
            res.append(re.joined(separator: " "))
        }
        return res
    }
    
    private func _wordBreak(_ dp: [[Int]], _ index: Int) -> [[Int]] {
        if index == 0 {
            return [[]]
        }
        var pd = [[Int]]()
        for num in dp[index] {
            var res = _wordBreak(dp, num)
            if num != 0 {
                for i in 0..<res.count {
                    res[i].append(num)
                }
            }
            pd += res
        }
        return pd
    }
}

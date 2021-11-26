//
//  091_Decode_Ways.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/26.
//

import Foundation

extension Solution {
    func numDecodings(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        let ls = Array(s)
        let first = ls[0]
        if first == "0" {
            return 0
        }
        if s.count == 1 {
            return 1
        }
        
        var dp = Array(repeating: 0, count: s.count + 1)
        dp[0] = 1
        for i in 0..<s.count {
            let char = ls[i]
            dp[i+1] = char == "0" ? 0 : dp[i]
            if i > 0 {
                let preChar = ls[i - 1]
                if preChar == "1" || (preChar == "2" && char.wholeNumberValue! <= 6) {
                    dp[i+1] += dp[i-1];
                }
            }
        }
        return dp[s.count]
    }

    
//    func numDecodings(_ s: String) -> Int {
//        if s.isEmpty {
//            return 0
//        }
//        let ls = Array(s)
//        let first = ls[0]
//        if first == "0" {
//            return 0
//        }
//        if s.count == 1 {
//            return 1
//        }
//        return _numDecodings(ls).count
//    }
//
//    private func _numDecodings(_ ls: [Character]) -> [[Character]] {
//        if ls.count == 1 {
//            return [ls]
//        } else {
//            let char = ls[ls.count - 1]
//            if ls.count > 1 {
//                let preChar = ls[ls.count - 2]
//                if char == preChar, char == "0" {
//                    return []
//                }
//            }
//            var res = [[Character]]()
//            let rs = _numDecodings(Array(ls[..<(ls.count - 1)]))
//            for r in rs {
//                let preChar = r[r.count - 1]
//                if preChar.isNumber {
//                    if char == "0", r.count > 1 {
//                        res.append(["*"])
//                    }
//                    if preChar == "1", char != "0" {
//                        res.append(["*"])
//                    }
//                    if preChar == "2", let num = char.wholeNumberValue, num > 0, num < 7 {
//                        res.append(["*"])
//                    }
//                } else {
//                    if char == "0" {
//                        continue
//                    }
//                }
//                res.append([char])
//            }
//            return res
//        }
//    }
}

//
//  097_Interleaving_String.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/30.
//

import Foundation

extension Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        if s1.isEmpty {
            return s2 == s3
        }
        if s2.isEmpty {
            return s1 == s3
        }
        let ls1 = Array(s1), ls2 = Array(s2), ls3 = Array(s3)
        if ls1.count + ls2.count != ls3.count {
            return false
        }
        let m = ls1.count, n = ls2.count

        var dp = Array(repeating: Array(repeating: false, count: n + 1), count: m + 1)
        dp[0][0] = true
        for i in 1...m {
            dp[i][0] = dp[i - 1][0] && (ls1[i - 1] == ls3[i - 1])
        }
        for j in 1...n {
            dp[0][j] = dp[0][j - 1] && (ls2[j - 1] == ls3[j - 1])
        }

        for i in 1...m {
            for j in 1...n {
                dp[i][j] = dp[i-1][j] && ls1[i-1] == ls3[i + j - 1]
                        || dp[i][j-1] && ls2[j-1] == ls3[i + j - 1];
            }
        }
        return dp[m][n]
    }
    
//    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
//        let ls1 = Array(s1), ls2 = Array(s2), ls3 = Array(s3)
//        if ls1.count + ls2.count != ls3.count {
//            return false
//        }
//        if s1 + s2 == s3 {
//            return true
//        }
//        return _isInterleave(ls1, 0,
//                             ls2, 0,
//                             ls3, 0)
//    }
//
//    private func _isInterleave(_ s1: [Character], _ index1: Int,
//                               _ s2: [Character], _ index2: Int,
//                               _ s3: [Character], _ index3: Int) -> Bool {
//        if index3 == s3.count {
//            return true
//        }
//        if index1 < s1.count, s1[index1] == s3[index3] {
//            let res = _isInterleave(s1, index1 + 1,
//                                    s2, index2,
//                                    s3, index3 + 1)
//            if res {
//                return true
//            }
//        }
//        if index2 < s2.count, s2[index2] == s3[index3] {
//            let res = _isInterleave(s1, index1,
//                                    s2, index2 + 1,
//                                    s3, index3 + 1)
//            if res {
//                return true
//            }
//        }
//        return false
//    }
}

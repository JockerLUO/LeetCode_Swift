//
//  085_Maximal_Rectangle.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/12.
//

import Foundation

extension Solution {
    
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        guard !matrix.isEmpty else { return 0 }
        let m = matrix.count, n = matrix[0].count
        if n == 0 {
            return 0
        }
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        var maxArea = 0
        
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == "1" {
                    if i == 0 {
                        dp[i][j] = 1
                    } else {
                        dp[i][j] = dp[i - 1][j] + 1
                    }
                }
            }
        }
        for nums in dp {
            let area = largestRectangleArea(nums)
            maxArea = max(maxArea, area)
        }
        return maxArea
    }
        
//    func maximalRectangle(_ matrix: [[Character]]) -> Int {
//        guard !matrix.isEmpty else { return 0 }
//        let m = matrix.count, n = matrix[0].count
//        if n == 0 {
//            return 0
//        }
//
//        var dp = Array(repeating: Array(repeating: (0, 0), count: n), count: m)
//
//        var maxArea = 0
//        if matrix[0][0] == "1" {
//            dp[0][0] = (1, 1)
//            maxArea = 1
//        }
//
//        for i in 1..<m {
//            if matrix[i][0] == "1" {
//                let item = (dp[i - 1][0].0 + 1, 1)
//                dp[i][0] = item
//                maxArea = max(maxArea, item.0 * item.1)
//            }
//        }
//
//        for j in 1..<n {
//            if matrix[0][j] == "1" {
//                let item = (1, dp[0][j - 1].1 + 1)
//                dp[0][j] = item
//                maxArea = max(maxArea, item.0 * item.1)
//            }
//        }
//
//        for i in 1..<m {
//            for j in 1..<n {
//                if matrix[i][j] == "1" {
//                    let item1 = dp[i - 1][j - 1]
//                    let item2 = dp[i - 1][j    ]
//                    let item3 = dp[i    ][j - 1]
//                    let res1 = matrix[i - 1][j - 1] == "1"
//                    let res2 = matrix[i - 1][j    ] == "1"
//                    let res3 = matrix[i    ][j - 1] == "1"
//
//                    var x = 1, y = 1
//                    if res1, res2, res3 {
//                        x = min(item1.0, item2.0) + 1
//                        y = min(item1.1, item3.1) + 1
//                        let area = x * y
//
//                        if area < item2.0 + 1 {
//                            x = item2.0 + 1
//                            y = 1
//                        } else if area < item3.1 + 1 {
//                            x = 1
//                            y = item3.1 + 1
//                        }
//                    } else if res2, res3 {
//                        if item2.0 > item3.1 {
//                            x = item2.0 + 1
//                        } else {
//                            y = item3.1 + 1
//                        }
//                    } else if res2 {
//                        x = item2.0 + 1
//                    } else if res3 {
//                        y = item3.1 + 1
//                    }
//                    let item = (x, y)
//                    dp[i][j] = item
//                    maxArea = max(maxArea, item.0 * item.1)
//                }
//            }
//        }
//        return maxArea
//    }
}

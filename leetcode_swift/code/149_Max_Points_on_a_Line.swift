//
//  149_Max_Points_on_a_Line.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/11/25.
//

import Foundation

extension Solution {
    func maxPoints(_ points: [[Int]]) -> Int {
        let count = points.count
        var dp = Array(repeating: Array(repeating: 0, count: count), count: count)
        var ls: [[String: [Int]]] = Array(repeating: [:], count: count)
        var maxP = 0
        for i in 0..<count {
            for j in i + 1..<count {
                if dp[i][j] == 1 {
//                    print("跳过", i, j)
                    continue
                }
                
//                print("遍历", i, j)
                ///cy = ax + b
                var a = 0, b = 0, c = 0
                let x0 = points[i][0], y0 = points[i][1],
                    x1 = points[j][0], y1 = points[j][1]
                if x0 == x1 {
                    a = 1
                    b = -x0
                } else if y0 == y1 {
                    c = 1
                    b = y0
                } else {
                    c = 1
                    let A = Double(y1 - y0) / Double(x1 - x0)
                    a = Int(A * 10000)
                    let B = Double(y0) - Double(x0) * A
                    b = Int(B * 10000)
                }
                
                let key = "\(a)-\(b)-\(c)"
                print("key", key)
                var l = ls[i][key] ?? []
                l.forEach { k in
                    dp[k][j] = 1
//                    print("添加", k, j)
                }
                l.append(j)
                ls[i][key] = l
                dp[i][j] = 1
                maxP = max(maxP, l.count)
            }
            //若某次最大个数超过所有点的一半，则不可能存在其他直线通过更多的点
            if maxP > count / 2 {
                break
            }
        }
        return maxP + 1
    }
}
 

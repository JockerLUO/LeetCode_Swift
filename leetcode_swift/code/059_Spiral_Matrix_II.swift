//
//  059_Spiral_Matrix_II.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/5.
//

import Foundation

extension Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        if n == 1 {
            return [[1]]
        }
                
        let ls = Array(repeating: 0, count: n)
        var res = Array(repeating: ls, count: n)
        
        let offsets = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        let pointOffsets = [(1, 1), (1, -1), (-1, -1), (-1, 1)]
        var points = [(1, 0), (0, n - 1), (n - 1, n - 1), (n - 1, 0)]
        var currPoint = 1
        
        var xOffset = offsets[0].0, yOffset = offsets[0].1
        var x = 0
        var y = 0

        var num = 1
        while true {
            if res[x][y] != 0 {
                break
            }
            res[x][y] = num
            num += 1
            
            let point = points[currPoint]
            if x == point.0, y == point.1 {
                
                xOffset = offsets[currPoint].0
                yOffset = offsets[currPoint].1
                points[currPoint] = (point.0 + pointOffsets[currPoint].0, point.1 + pointOffsets[currPoint].1)
                currPoint += 1
                currPoint = currPoint % 4
            }

            x += xOffset
            y += yOffset
        }
        return res

    }
}

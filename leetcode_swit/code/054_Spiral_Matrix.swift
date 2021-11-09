//
//  054_Spiral_Matrix.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/3.
//

import Foundation

extension Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        
        let m = matrix.count, n = matrix[0].count
                
        var res = [Int]()
        var x = 0
        var y = 0
        
        var xOffset = 0
        var yOffset = 1
        
        let offsets = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        let pointOffsets = [(1, 1), (1, -1), (-1, -1), (-1, 1)]
        var points = [(1, 0), (0, n - 1), (m - 1, n - 1), (m - 1, 0)]
        var currPoint = 1

        var matrixC: [[Int?]] = matrix
        while true {
            let num = matrix[x][y]
            if matrixC[x][y] == nil {
                break
            }
            matrixC[x][y] = nil
            res.append(num)
            
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
            if x >= m || x < 0 || y >= n || y < 0 {
                break
            }
        }
        return res
    }
}

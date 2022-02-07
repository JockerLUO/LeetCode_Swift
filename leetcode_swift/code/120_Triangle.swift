//
//  120_Triangle.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/28.
//

import Foundation

extension Solution {

    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var nums = triangle
        for i in Array(0..<triangle.count - 1).reversed() {
            for j in 0..<triangle[i].count {
                nums[i][j] += min(nums[i + 1][j], nums[i + 1][j + 1])
            }
        }
        return nums[0][0]
    }
        
//    private static var minimum: Int = 0
//    private func _minimumTotal(_ triangle: [[Int]], _ index: (Int, Int), _ sum: Int) {
//        let left = triangle[index.0 + 1][index.1]
//        let right = triangle[index.0 + 1][index.1 + 1]
//        if index.0 < triangle.count - 2 {
//            _minimumTotal(triangle, (index.0 + 1, index.1), sum + left)
//            _minimumTotal(triangle, (index.0 + 1, index.1 + 1), sum + right)
//        } else {
//            Self.minimum = min(Self.minimum, min(sum + left, sum + right))
//        }
//    }
}

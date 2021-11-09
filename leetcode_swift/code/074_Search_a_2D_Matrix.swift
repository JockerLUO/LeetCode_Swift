//
//  074_Search_a_2D_Matrix.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/9.
//

import Foundation

extension Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count, n = matrix[0].count
        if m == 0 || n == 0 {
            return false
        }
        
        var top = 0, bottom = m - 1
        while bottom - top > 1 {
            let mid = (top + bottom) / 2
            let num = matrix[mid][0]
            if num < target {
                top = mid
            } else if num > target {
                bottom = mid
            } else {
                return true
            }
        }
        
        let row = matrix[bottom][0] > target ? top : bottom, nums = matrix[row]
        var left = 0, right = n - 1
        
        while left <= right {
            let mid = (right - left) / 2 + left
            if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid - 1
            }  else {
                return true
            }
        }
        
        return false
    }
}

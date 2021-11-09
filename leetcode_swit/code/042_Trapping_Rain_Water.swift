//
//  042_Trapping_Rain_Water.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/10/13.
//

import Foundation

extension Solution {
    func trap(_ height: [Int]) -> Int {
        if height.count <= 2 {
            return 0
        }
        
        var maxH = height[0]
        var maxIndex = 0
        var sumH = 0  //总高度,墙体的面积
        
        let count = height.count
        for i in 0..<count {
            let h = height[i]
            sumH += h
            if h > maxH {
                maxH = h
                maxIndex = i
            }
        }
        
        var sumA = 0 ///总面积,墙体加水的面积
        var left = 0
        var right = count - 1
        let offset = max(count - 1 - maxIndex, maxIndex)
        for i in 1...offset {
            if left < maxIndex, height[i] >= height[left] {
                let area = (i - left) * height[left] ///左侧的面积
                sumA += area
                left = i
            }
            let j = count - 1 - i
            if right > maxIndex, height[j] >= height[right] {
                let area = (right - j) * height[right] ///右侧的面积
                sumA += area
                right = j
            }
        }
        sumA += maxH
        
        return sumA - sumH
    }
}

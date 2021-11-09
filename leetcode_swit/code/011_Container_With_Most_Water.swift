//
//  011_Container_With_Most_Water.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/24.
//

import Foundation

extension Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1
        var maxArea = 0
        while left < right {
            let leftH = height[left], rightH = height[right]
            let area = min(leftH, rightH) * (right - left)
            maxArea = max(maxArea, area)
            if leftH < rightH {
                left += 1
            } else {
                right -= 1
            }
        }
        return maxArea
    }
}

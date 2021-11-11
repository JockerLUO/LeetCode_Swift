//
//  084_Largest_Rectangle_in_Histogram.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/11.
//

import Foundation

extension Solution {
    ///https://leetcode-cn.com/problems/largest-rectangle-in-histogram/solution/bao-li-jie-fa-zhan-by-liweiwei1419/
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var heights = heights
        heights.append(-1)
        
        var stack = [-1]
        var maxArea = 0
        
        for (idx, height) in heights.enumerated() {
            // pop stack until last height is smaller than current height
            while let last = stack.last, last >= 0 && heights[last] > height {
                stack.removeLast()
                if let left = stack.last {
                    let area = (idx - left - 1) * heights[last]
                    maxArea = max(area, maxArea)
                }
            }
            stack.append(idx)
        }
        return maxArea
    }
    
//    func largestRectangleArea(_ heights: [Int]) -> Int {
//
//        var ls = Array(0..<heights.count)
//        var maxArea = 0
//        var currHeight = 1
//        while ls.count > 0 {
//            let count = ls.count
//            var left = -1, right = -1
//            var minHeightOffset = Int.max - currHeight
//
//            for i in 0..<ls.count {
//                let index = count - 1 - i
//                let height = heights[ls[index]]
//                if height > currHeight {
//                    minHeightOffset = min(minHeightOffset, height - currHeight)
//                }
//
//                if height < currHeight {
//                    ls.remove(at: index)
//                    if right != -1 {
//                        let area = (right - left + 1) * currHeight
//                        maxArea = max(maxArea, area)
//                    }
//                    right = -1
//
//                } else if right != -1, left != -1, ls[right] - ls[index] != right - index {
//                    let area = (right - left + 1) * currHeight
//                    maxArea = max(maxArea, area)
//
//                    right = index
//                    left = index
//
//                } else {
//                    if right == -1 {
//                        right = index
//                    }
//                    left = index
//                }
//            }
//            if right != -1, left != -1 {
//                var area = 0
//                if ls[right] - ls[left] == right - left {
//                    area = (right - left + 1) * currHeight
//                } else {
//                    area = max(heights[ls[left]], heights[ls[right]])
//                }
//                maxArea = max(maxArea, area)
//            }
//            currHeight += minHeightOffset
//        }
//
//        return maxArea
//    }
}

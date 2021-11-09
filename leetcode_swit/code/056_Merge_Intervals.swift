//
//  056_Merge_Intervals.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/4.
//

import Foundation

extension Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let lIntervals = intervals.sorted { ls1, ls2 in
            return ls1[0] < ls2[0]
        }
//        print(intervals)
//        print(lIntervals)

        var left = lIntervals[0][0]
        var right = lIntervals[0][1]
        
        var res = [[Int]]()
        for i in 1..<lIntervals.count {
            let currLeft = lIntervals[i][0]
            let currRight = lIntervals[i][1]
            
            if currLeft <= right {
                right = max(right, currRight)
            } else {
                res.append([left, right])
                left = currLeft
                right = currRight
            }
        }
        res.append([left, right])
        return res
    }
}

//
//  057_Insert_Interval.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/4.
//

import Foundation

extension Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        
        let newL = newInterval[0], newR = newInterval[1]
        let left = searchIndex(intervals, newL), right = searchIndex(intervals, newR)
        
        var res = [[Int]]()
        
        if left > 0 {
            if left % 2 == 1 {
                res += Array(intervals[0...left / 2])
            } else {
                res += Array(intervals[0..<left / 2])
            }
        }
        
        let intervalL = (left % 2 == 1 || left == -1) ? newL : intervals[left / 2][0]
        let intervalR = (right % 2 == 1 || right == -1) ? newR : intervals[right / 2][1]
        res.append([intervalL, intervalR])
        
        if right != intervals.count * 2 - 1 {
            if right == -1 {
                res += intervals
            } else {
                res += Array(intervals[(right / 2 + 1)...])
            }
        }
        return res
    }
    
    private func searchIndex(_ intervals: [[Int]], _ target: Int) -> Int {
        guard !intervals.isEmpty && !intervals[0].isEmpty  else {
            return -1
        }
        var res = -1
        if target < intervals[0][0] {
            res = -1
        } else if target > intervals[intervals.count - 1][1] {
            res = intervals.count * 2 - 1
        } else {
            var left = 0, right = intervals.count * 2 - 1
            while right - left > 1 {
                let mid = (left + right) / 2
                let num = intervals[mid / 2][mid % 2 == 0 ? 0 : 1]
                if target < num {
                    right = mid
                } else if target > num {
                    left = mid
                } else {
                    res = mid - mid % 2
                    break
                }
            }
            if res == -1 {
                res = (left + right) / 2
            }
        }
        return res
    }
    
    //    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    //
    //        var left = -1, right = -1
    //        let newL = newInterval[0], newR = newInterval[1]
    //
    //        for i in 0..<intervals.count {
    //            let currLeft = intervals[i][0]
    //            let currMid = intervals[i][1]
    //            let currRight = i + 1 < intervals.count ? intervals[i + 1][0] : Int.max
    //            if currLeft <= newL, newL <= currMid {
    //                left = i * 2
    //            }
    //            if currMid < newL, newL < currRight {
    //                left = i * 2 + 1
    //            }
    //            if currLeft <= newR, newR <= currMid {
    //                right = i * 2
    //            }
    //            if currMid < newR, newR < currRight {
    //                right = i * 2 + 1
    //            }
    //            if right != -1 {
    //                break
    //            }
    //        }
    //
    //        var res = [[Int]]()
    //
    //        if left >= 1 {
    //            if left % 2 == 1 {
    //                res += Array(intervals[0...left / 2])
    //            } else {
    //                res += Array(intervals[0..<left / 2])
    //            }
    //        }
    //
    //        let intervalL = (left % 2 == 1 || left == -1) ? newL : intervals[left / 2][0]
    //        let intervalR = (right % 2 == 1 || right == -1) ? newR : intervals[right / 2][1]
    //        res.append([intervalL, intervalR])
    //
    //        if right != intervals.count * 2 - 1 {
    //            if right == -1 {
    //                res += intervals
    //            } else {
    //                res += Array(intervals[(right / 2 + 1)...])
    //            }
    //        }
    //        return res
    //    }
}

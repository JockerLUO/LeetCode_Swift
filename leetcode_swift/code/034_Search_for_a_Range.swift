//
//  034_Search_for_a_Range.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/10/8.
//

import Foundation

extension Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard !nums.isEmpty else {
            return [-1, -1]
        }
        let left = searchNum(nums, Double(target) - 0.5).1
        if left >= nums.count || nums[left] != target {
            return [-1, -1]
        }
        let right = searchNum(nums, Double(target) + 0.5).0
        return [left, right]
    }
    
    private func searchNum(_ nums: [Int], _ value: Double) -> (Int, Int) {
        if value < Double(nums[0]) {
            return (-1, 0)
        }
        if value > Double(nums[nums.count - 1]) {
            return (nums.count - 1, nums.count)
        }
        var left = 0
        var right = nums.count - 1
        while right - left > 1 {
            let mid = (left + right) / 2
            if Double(nums[mid]) < value {
                left = mid
            } else {
                right = mid
            }
        }
        return (left, right)
    }
}

//
//  035_Search_Insert_Position.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/10/8.
//

import Foundation

extension Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        let value = searchNum(nums, target)
        if value.0 < nums.count, nums[value.0] == target {
            return value.0
        } else {
            return value.1
        }
    }
    
    private func searchNum(_ nums: [Int], _ target: Int) -> (Int, Int) {
        if target < nums[0] {
            return (0, 0)
        }
        if target > nums[nums.count - 1] {
            return (nums.count - 1, nums.count)
        }
        var left = 0
        var right = nums.count - 1
        while right - left > 1 {
            let mid = (left + right) / 2
            if nums[mid] < target {
                left = mid
            } else {
                right = mid
            }
        }
        return (left, right)
    }
}

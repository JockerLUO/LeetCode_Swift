//
//  033_Search_in_Rotated_Sorted_Array.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/10/8.
//

import Foundation

extension Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right) / 2
            guard nums[mid] != target else { return mid }

            if nums[left] <= nums[mid] {  ///左侧是否有序
                if nums[left] <= target ///有序的情况下是否在左侧
                    && nums[mid] >= target {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else { ///左侧无序, 右侧必定有序
                if nums[mid] <= target ///有序的情况下是否在右侧
                    && nums[right] >= target {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return -1
    }
}

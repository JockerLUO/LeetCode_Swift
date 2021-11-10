//
//  081_Search_in_Rotated_Sorted_Array_II.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/10.
//

import Foundation

extension Solution {
    func searchII(_ nums: [Int], _ target: Int) -> Bool {

        var left = 0, right = nums.count - 1
        if nums[left] >= nums[right] {
            while right - left > 1{
                while left < right, nums[left] == nums[left + 1] {
                    left += 1
                }
                while left < right, nums[right] == nums[right - 1] {
                    right -= 1
                }
                if right - left == 1 {
                    break
                }
                let mid = (left + right) / 2
                if nums[left] >= nums[mid] {
                    right = mid
                } else if nums[right] <= nums[mid] {
                    left = mid
                }
            }
            
            print(nums, target, left, right)
            
            if nums[0] <= target, target <= nums[left]  {
                right = left
                left = 0
            } else if nums[right] <= target, target <= nums[nums.count - 1] {
                left = right
                right = nums.count - 1
            } else {
                return false
            }
        }

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
    
//    func searchII(_ nums: [Int], _ target: Int) -> Bool {
//        var left = 0
//        var right = nums.count - 1
//        var mid = 0
//
//        while left <= right {
//            mid = (right - left) / 2 + left
//
//            if nums[mid] == target {
//                return true
//            }
//
//            if nums[mid] > nums[left] {
//                if nums[mid] > target && target >= nums[left] {
//                    right = mid - 1
//                } else {
//                    left = mid + 1
//                }
//            } else if nums[mid] < nums[left]{
//                if nums[mid] < target && target <= nums[right] {
//                    left = mid + 1
//                } else {
//                    right = mid - 1
//                }
//            } else {
//                left += 1
//            }
//        }
//
//        return false
//    }

}

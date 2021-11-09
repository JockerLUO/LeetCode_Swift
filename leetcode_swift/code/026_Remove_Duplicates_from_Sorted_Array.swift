//
//  026_Remove_Duplicates_from_Sorted_Array.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/28.
//

import Foundation

extension Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count < 2 {
            return nums.count
        }
        var offset = nums.count - 1
        var pre: Int?
        repeat {
            if nums[offset] == pre {
                nums.remove(at: offset)
            } else {
                pre = nums[offset]
            }
            offset -= 1
        } while offset >= 0
//        print(nums)
        return nums.count
    }
}

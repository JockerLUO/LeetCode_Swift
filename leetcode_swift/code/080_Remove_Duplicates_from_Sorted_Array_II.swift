//
//  080_Remove_Duplicates_from_Sorted_Array_II.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/10.
//

import Foundation

extension Solution {
    func removeDuplicates_II(_ nums: inout [Int]) -> Int {
        if nums.count < 2 {
            return nums.count
        }
        var offset = nums.count - 1
        var pre: Int?
        var preP: Int?
        repeat {
            if nums[offset] == pre {
                if nums[offset] == preP {
                    nums.remove(at: offset)
                } else {
                    preP = nums[offset]
                }
            } else {
                pre = nums[offset]
                preP = nil
            }
            offset -= 1
        } while offset >= 0
        return nums.count
    }
}

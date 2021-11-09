//
//  027_Remove_Element.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/28.
//

import Foundation

extension Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.isEmpty {
            return 0
        }
        var offset = nums.count - 1
        repeat {
            if nums[offset] == val {
                nums.remove(at: offset)
            }
            offset -= 1
        } while offset >= 0
        return nums.count
    }
}

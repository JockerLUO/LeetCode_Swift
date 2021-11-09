//
//  031_Next_Permutation.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/30.
//

import Foundation

extension Solution {
    
    // https://leetcode-cn.com/problems/next-permutation/solution/xia-yi-ge-pai-lie-suan-fa-xiang-jie-si-lu-tui-dao-/
    func nextPermutation(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        
        func reverse(from start: Int) {
            var start = start
            var end = nums.count - 1
            while start < end {
                nums.swapAt(start, end)
                start += 1
                end -= 1
            }
        }

        var i = nums.count - 2 // index of first descending number
        while i >= 0 && nums[i] >= nums[i + 1] {
            i -= 1
        }
        
        if i >= 0 {
            var j = nums.count - 1 // index of the number just larger than nums[i]
            while j > i && nums[j] <= nums[i] {
                j -= 1
            }
            nums.swapAt(i, j);
        }
        reverse(from: i + 1)
    }
}

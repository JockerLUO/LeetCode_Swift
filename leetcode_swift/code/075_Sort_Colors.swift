//
//  075_Sort_Colors.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/9.
//

import Foundation

extension Solution {
//    func sortColors(_ nums: inout [Int]) {
//        var num0 = 0, num1 = 0, num2 = 0
//        for i in 0..<nums.count {
//            if nums[i] == 0 {
//                nums[num2] = 2
//                num2 += 1
//                nums[num1] = 1
//                num1 += 1
//                nums[num0] = 0
//                num0 += 1
//            } else if nums[i] == 1 {
//                nums[num2] = 2
//                num2 += 1
//                nums[num1] = 1
//                num1 += 1
//            } else {
//                nums[num2] = 2
//                num2 += 1
//            }
//        }
//    }

    func sortColors(_ nums: inout [Int]) {
        let count = nums.count
        for i in 0..<count {
            for j in 0..<count - i - 1 {
                if nums[j] >= nums[j + 1] {
                    let temp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = temp
                }
            }
        }
    }
}

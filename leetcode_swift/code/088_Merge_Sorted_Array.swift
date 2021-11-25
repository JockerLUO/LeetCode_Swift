//
//  088_Merge_Sorted_Array.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/25.
//

import Foundation

extension Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var r1 = m - 1
        var r2 = n - 1
        while r1 >= 0 || r2 >= 0 {
            if r1 < 0 {
                nums1[r2] = nums2[r2]
                r2 -= 1
            } else if r2 < 0 {
                break
            } else  if nums1[r1] > nums2[r2] {
                nums1[r1 + r2 + 1] = nums1[r1]
                r1 -= 1
            } else {
                nums1[r1 + r2 + 1] = nums2[r2]
                r2 -= 1
            }
        }
    }
}

//
//  004_Median_of_Two_Sorted_Arrays.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/23.
//

import Foundation

//https://discuss.leetcode.com/topic/4996/share-my-o-log-min-m-n-solution-with-explanation

extension Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let ls1 = nums1.count, ls2 = nums2.count
        if ls1 < ls2 {
            return findMedianSortedArrays(nums2, nums1)
        }
        var l = 0, r = ls2 * 2
        let maxInt = Int.max, minInt = Int.min
        
        while l <= r {
            let mid2 = (l + r) / 2
            let mid1 = ls1 + ls2 - mid2
            let L1 = mid1 == 0       ? minInt : nums1[(mid1 - 1) / 2]
            let L2 = mid2 == 0       ? minInt : nums2[(mid2 - 1) / 2]
            let R1 = mid1 == 2 * ls1 ? maxInt : nums1[mid1       / 2]
            let R2 = mid2 == 2 * ls2 ? maxInt : nums2[mid2       / 2]
            
//            print(l, r, mid1, mid2)
//            print(L1, L2, R1, R2)
//            print()
            
            if L1 > R2  {
                l = mid2 + 1
            } else if L2 > R1 {
                r = mid2 - 1
            } else {
                return Double(max(L1, L2) + min(R1, R2)) / 2.0
            }
        }
        return 0
    }
}

//
//  128_Longest_Consecutive_Sequence.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/2/9.
//

import Foundation

extension Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var hash_dict = [Int: Int]()
        
        var max_length = 0
        for num in nums {
            if hash_dict[num] != nil {
                continue
            }
            let left = hash_dict[num - 1] ?? 0
            let right = hash_dict[num + 1] ?? 0
            let cur_length = 1 + left + right
            max_length = max(cur_length, max_length)
            
            hash_dict[num] = cur_length
            hash_dict[num - left] = cur_length
            hash_dict[num + right] = cur_length
        }
        return max_length
    }
}

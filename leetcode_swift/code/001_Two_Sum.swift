//
//  File.swift
//  
//
//  Created by jocker luo on 2021/9/17.
//

import Foundation

extension Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        for (index, num) in nums.enumerated() {
            if let preIndex = map[target - num] {
                return [preIndex, index]
            } else {
                map[num] = index
            }
        }
        return [Int]()
    }
}


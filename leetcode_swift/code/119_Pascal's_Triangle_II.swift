//
//  119_Pascal's_Triangle_II.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/28.
//

import Foundation

extension Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var res = [[1]]
        for i in 1..<(rowIndex + 1) {
            res.append(_generate(res[i - 1]))
        }
        return res[rowIndex]
    }
    
    private func _generate(_ nums: [Int]) -> [Int] {
        var ls = [Int]()
        for i in 0...nums.count {
            if i == 0 || i == nums.count {
                ls.append(1)
            } else {
                ls.append(nums[i - 1] + nums[i])
            }
        }
        return ls
    }
}

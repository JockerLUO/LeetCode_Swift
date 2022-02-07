//
//  118_Pascal's_Triangle.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/1/28.
//

import Foundation

extension Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var res = [[1]]
        for i in 1..<numRows {
            res.append(_generate(res[i - 1]))
        }
        return res
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

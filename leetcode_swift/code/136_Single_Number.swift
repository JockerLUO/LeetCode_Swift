//
//  136_Single_Number.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/6/13.
//

import Foundation

extension Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var res = 0
        for num in nums {
            res = res ^ num
        }
        return res
    }
}

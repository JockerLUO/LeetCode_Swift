//
//  137_Single_Number_II.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/6/13.
//

import Foundation

extension Solution {
//    func singleNumber_II(_ nums: [Int]) -> Int {
//        var a = 0, b = 0
//        for num in nums {
//            b = (b ^ num) & ~a
//            a = (a ^ num) & ~b
//        }
//        return b
//    }
    
    func singleNumber_II(_ nums: [Int]) -> Int {
        var res: Int32 = 0
        for i in 0..<32 {
            let mask: Int32 = 1 << i
            var cut = 0
            for num in nums {
                let n = Int32(num)
                if n & mask != 0 {
                    cut += 1
                }
            }
            if cut % 3 != 0 {
                res |= mask
            }
        }
        return Int(res)
    }
}

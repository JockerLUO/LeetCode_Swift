//
//  069_Sqrt(x).swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/8.
//

import Foundation

extension Solution {
    
    func mySqrt(_ x: Int) -> Int {
        if x == 1 {
            return x
        }
        var min = 0, max = x
        while max - min > 1 {
            let mid = (max + min) / 2
            if x / mid < mid {
                max = mid
            } else {
                min = mid
            }
        }
        return min
    }

//    func mySqrt(_ x: Int) -> Int {
//        if x == 1 {
//            return x
//        }
//        var num = x
//        while num * num > x {
//            num = (num + x/num) / 2
//        }
//        return num
//    }
}

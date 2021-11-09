//
//  029_Divide_Two_Integers.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/29.
//

import Foundation

extension Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if dividend == 0 || divisor == 1 {
            return dividend
        }
        if dividend == Int32.min, divisor == -1 {
            return Int(Int32.max);
        }

        let negative = dividend ^ divisor < 0 //用异或来计算是否符号相异

        var t = abs(dividend)
        let d = abs(divisor)
        var result = 0

        for n in 0...31 {
            let i = 31 - n
            if ((t>>i) >= d) {      //找出足够大的数2^n*divisor
                result += (1<<i)    //将结果加上2^n
                t -= d<<i           //将被除数减去2^n*divisor
            }
            print(i, t)
        }
        return negative ? -result : result//符号相异取反
    }
    
//    func divide(_ dividend: Int, _ divisor: Int) -> Int {
//        let isPositive = (dividend < 0) == (divisor < 0)
//        var dividend = abs(dividend), divisor = abs(divisor), count = 0
//
//        while dividend >= divisor {
//            var shift = 0
//
//            while dividend >= (divisor << shift) {
//                shift += 1
//            }
//
//            dividend -= divisor << (shift - 1)
//
//            count += (1 << (shift - 1))
//        }
//
//        return refactorCount(count, isPositive)
//    }
//
//    private func refactorCount(_ count: Int, _ isPositive: Bool) -> Int {
//        let INTMAX = 2147483647
//        var count = count
//
//        if isPositive {
//            if count > INTMAX {
//                count = INTMAX
//            }
//        } else {
//            count *= -1
//        }
//
//        return count
//    }
}

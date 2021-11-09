//
//  050_Pow(x, n).swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/10/29.
//

import Foundation

extension Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if x == 1 {
            return x
        }
        if n == 0 {
            return 1
        }
        var num = 1.0
        
        var y = x
        var i = n
        repeat {
            if(i % 2 != 0){
                num *= y
            }
            y = y * y
            i = i / 2
        } while i != 0
        return n < 0 ? 1 / num : num
    }
}

//
//  009_Palindrome_Number.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/24.
//

import Foundation

extension Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        return x == reverse(x)
    }
    
//    func isPalindrome(_ x: Int) -> Bool {
//            guard x >= 0 else {
//                return false
//            }
//            
//            var x = x
//            var div = 1
//            
//            while (x / div >= 10) {
//                div = div * 10
//            }
//            
//            while (x > 0) {
//                var left = x / div
//                var right = x % 10
//                
//                if (left != right) {
//                    return false
//                }
//                
//                x = (x % div) / 10
//                div = div / 100
//            }
//            
//            return true
//        }
}

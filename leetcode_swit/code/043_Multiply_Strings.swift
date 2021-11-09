//
//  043_Multiply_Strings.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/10/14.
//

import Foundation

extension Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" {
            return "0"
        }
                
        let ls1 = Array(num1), ls2 = Array(num2)
        
        var res: [Int] = Array(repeating: 0, count: ls1.count + ls2.count)
                
        for i in 0..<ls1.count {
            let num1 = ls1[ls1.count - 1 - i].wholeNumberValue!
            for j in 0..<ls2.count {
                let num2 = ls2[ls2.count - 1 - j].wholeNumberValue!
                
                let index = ls1.count + ls2.count - 1 - (i + j)
                let num = num1 * num2 + res[index]
                                
                res[index] = num % 10
                res[index - 1] += num / 10
            }
        }
        if res[0] == 0 {
            res = Array(res[1...])
        }
        return res.map({ String($0)}).joined()
    }
}

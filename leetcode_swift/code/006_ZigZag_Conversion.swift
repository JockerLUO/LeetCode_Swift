//
//  006_ZigZag_Conversion.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/23.
//

import Foundation

extension Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {
            return s
        }
        let p = 2 * (numRows - 1)
        var result = [String](repeating: "", count: numRows)
        for (i, char) in Array(s).enumerated() {
            var floor = i % p
            if floor >= p / 2 {
                floor = p - floor
            }
            result[floor] += String(char)
        }
        return result.joined()
    }
    
//    func convert(_ s: String, _ numRows: Int) -> String {
//        if numRows == 1 {
//            return s
//        }
//        
//        var ret: [Character] = []
//        var chars: [Character] = Array(s)
//        let cnt = chars.count
//        
//        
//        for i in 0..<numRows {
//            let len = 2 * numRows - 2
//            var index = i
//            while index < cnt {
//                ret.append(chars[index])
//                
//                if i != 0 && i != numRows - 1 {
//                    let tmpIndex = index + 2 * (numRows - i - 1)
//                    if tmpIndex < cnt {
//                        ret.append(chars[tmpIndex])
//                    }
//                }
//                
//                index += len
//            }
//        }
//        
//        return String(ret)
//    }
}

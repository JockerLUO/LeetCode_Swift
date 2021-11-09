//
//  008_String_to_Integer(atoi).swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/24.
//

import Foundation

extension Solution {
    func myAtoi(_ s: String) -> Int {
        let ls = Array(s)
        var res = 0
        var isPos = 1
        var valid = false
        for (i, char) in ls.enumerated() {
            if char >= "0", char <= "9" {
                valid = true
                res = res * 10 + char.wholeNumberValue!
                if res > Int32.max {
                    break
                }
            } else {
                if valid {
                    break
                }
                if char == " " {
                    continue
                }
                if char == "-" {
                    if i == 0 || (ls[i - 1] == " ") {
                        isPos = -1
                        valid = true
                        continue
                    }
                }
                if char == "+" {
                    if i == 0 || (ls[i - 1] == " ") {
                        valid = true
                        continue
                    }
                }
                break
            }
        }
        res = res * isPos
        res = min(res, Int(Int32.max))
        res = max(res, Int(Int32.min))
        return res
    }
}

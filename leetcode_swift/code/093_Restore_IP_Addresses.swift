//
//  093_Restore_IP_Addresses.swift
//  leetcode_swift
//
//  Created by jocker luo on 2021/11/26.
//

import Foundation

extension Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        let ls = Array(s)
        let res = _restoreIpAddresses(ls)
        return res.filter { charGroup in
            return charGroup.count == 4
        }.map { charGroup in
            charGroup.map { chars in
                String(chars)
            }.joined(separator: ".")
        }
    }
    
    func _restoreIpAddresses(_ ls: [Character]) -> [[[Character]]] {
        if ls.count == 1 {
            return [[ls]]
        } else {
            let char = ls[ls.count - 1]
            var res = [[[Character]]]()
            let rs = _restoreIpAddresses(Array(ls[..<(ls.count - 1)]))
            for r in rs {
                let last = r.last!
                if let num = Int(String(last)), num != 0 {
                    let num = num * 10 + char.wholeNumberValue!
                    if num <= 255 {
                        var r = r
                        var last = r.popLast()
                        last?.append(char)
                        r.append(last!)
                        res.append(r)
                    }
                }
                if r.count < 4 {
                    res.append(r + [[char]])
                }
            }
            return res
        }
    }
}

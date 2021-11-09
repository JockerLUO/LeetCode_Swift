//
//  067_Add_Binary.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/8.
//

import Foundation

extension Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let als = Array(a), al = als.count
        let bls = Array(b), bl = b.count
        let n = max(al, bl)

        var offset = 0
        var res = [String]()
        for i in 0..<n {
            let aNum = al <= i ? 0 : als[al - 1 - i].wholeNumberValue!
            let bNum = bl <= i ? 0 : bls[bl - 1 - i].wholeNumberValue!
            let num = aNum + bNum + offset
//            print(num)
            
            offset = num / 2
            res.append("\(num % 2)")
        }
        if offset == 1 {
            res.append("1")
        }
        return res.reversed().joined()
    }
}

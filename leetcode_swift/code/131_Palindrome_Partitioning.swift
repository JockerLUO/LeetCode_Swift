//
//  131_Palindrome_Partitioning.swift
//  leetcode_swift
//
//  Created by jocker luo on 2022/2/9.
//

import Foundation

extension Solution {
    func partition(_ s: String) -> [[String]] {
        guard s.count > 1 else {
            return [[s]]
        }
        var ls = Array(s)
        for i in 0..<(ls.count - 1) {
            ls.insert("*", at: i * 2 + 1) ///添加"*",辅助寻找最长回文子串
        }
        var nums = Array(repeating: 0, count: ls.count)
        for i in 0..<((ls.count + 1) / 2) {
            var offset = 0
            while i + (offset + 1) < ls.count,
                  i - (offset + 1) >= 0,
                  ls[i + (offset + 1)] == ls[i - (offset + 1)] {
                offset += 1
            }
            nums[i] = offset
        }
        
        var res = [[String]]()
        let wls = Array(s)
        for i in 0..<((ls.count + 1) / 2) {
            if nums[i] == i { ///判断当前位置的回文子串是否从字符串开头起,如果是,裁剪头部后递归即可
                let pre = String(wls[...i])
                if i >= s.count - 1 {
                    res.append([pre])
                } else {
                    let sub = partition(String(wls[(i + 1)...]))
                    for l in sub {
                        res.append(([pre] + l))
                    }
                }
            }
        }
        return res
    }
}

//
//  017_Letter_Combinations_of_a_Phone_Number.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/26.
//

import Foundation

extension Solution {
    static let dmap: [Character: String] = ["2": "abc",
                                            "3": "def",
                                            "4": "ghi",
                                            "5": "jkl",
                                            "6": "mno",
                                            "7": "pqrs",
                                            "8": "tuv",
                                            "9": "wxyz",
                                            "0": " ",]
    
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else {
            return [String]()
        }
        var res = [String]()
        let ls = Array(digits)
        
        let posfix = self.letterCombinations(String(ls[1...]))
        let lm = Array(Self.dmap[ls[0]]!)
        for m in lm {
            if !posfix.isEmpty {
                let lp = Array(posfix)
                for p in lp {
                    let temp = String(m) + p
                    res.append(temp)
                }
            } else {
                res.append(String(m))
            }
        }
        return res
    }
}

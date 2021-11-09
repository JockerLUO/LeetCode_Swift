//
//  049_Group_Anagrams.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/10/29.
//

import Foundation

extension Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var res = [String: [String]]()
        for str in strs {
            let key = String(Array(str).sorted { $0.asciiValue! < $1.asciiValue! })
            if res[key] == nil {
                res[key] = []
            }
            res[key]?.append(str)
        }
        return Array(res.values)
    }
    
    private func anagramsHash(_ str: String) -> String {
        let ls = Array(str)
        var res = [Character: Int]()
        for char in ls {
            if res[char] == nil {
                res[char] = 0
            }
            res[char]! += 1
        }
        var hashStr = ""

        let keyStr = "asdfghjklqwertyuiopzxcvbnm"
        for char in Array(keyStr) {
            if let num = res[char] {
                hashStr.append("\(char)\(num)")
            }
        }
        
//        let keys = Array(res.keys).sorted { $0.asciiValue! < $1.asciiValue! }
//        for key in keys {
//            hashStr.append("\(key)\(res[key]!)")
//        }
        return hashStr
    }
    
//    static let anagramsHashes = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101]
//    private func anagramsHash(_ str: String) -> Int {
//        var hashNume = 1
//        let ls = Array(str)
//        for chr in ls {
//            let num = chr.asciiValue! - 97
//            hashNume = Self.anagramsHashes[Int(num)] * hashNume
////            let bit: Int = 1 << num
////            hashNume = hashNume & (~bit)
//        }
//        return hashNume
//    }
}

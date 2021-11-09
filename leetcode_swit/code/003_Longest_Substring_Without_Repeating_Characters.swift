//
//  003_Longest_Substring_Without_Repeating_Characters.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/9/17.
//

import Foundation

extension Solution {
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLen = 0, startId = 0, charToPos = [Character: Int]()
        let clist = Array(s)
        for (i, char) in clist.enumerated() {
            if let pos = charToPos[char] {
                startId = max(startId, pos)
            }
            charToPos[char] = i + 1
            maxLen = max(maxLen, i - startId + 1)
        }
        return maxLen
    }

//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        var maxLen = 0, startId = 0, charToPos = [Character: Int]()
//        Array(s).enumerated().forEach { i, char in
//            if let pos = charToPos[char] {
//                startId = max(startId, pos)
//            }
//            charToPos[char] = i + 1
//            maxLen = max(maxLen, i - startId + 1)
//        }
//        return maxLen
//    }
}

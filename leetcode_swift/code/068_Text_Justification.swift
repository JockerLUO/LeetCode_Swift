//
//  068_Text_Justification.swift
//  leetcode_swit
//
//  Created by jocker luo on 2021/11/8.
//

import Foundation

extension Solution {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
    
        var offset = 0
        var wordsGroup = [[String]]()
        var curr = [String]()
        for word in words {
            if offset + word.count > maxWidth {
                let spaceCount = maxWidth - offset + curr.count
                var res = [String]()
                if curr.count == 1 {
                    res = curr
                    res.append(spaceString(maxWidth - offset + 1))
                } else {
                    let j = spaceCount / (curr.count - 1)
                    let k = spaceCount % (curr.count - 1)
                    for (i, str) in curr.enumerated() {
                        res.append(str)
                        if i != curr.count - 1 {
                            if i < k {
                                res.append(spaceString(j + 1))
                            } else {
                                res.append(spaceString(j))
                            }
                        }
                    }
                }
                wordsGroup.append(res)
                curr = []
                offset = 0
            }
            offset += (word.count + 1)
            curr.append(word)
        }
        var res = [String]()
        for (i, str) in curr.enumerated() {
            res.append(str)
            if i == curr.count - 1 {
                if offset - 1 != maxWidth {
                    res.append(spaceString(maxWidth - offset + 1))
                }
            } else {
                res.append(" ")
            }
        }
        wordsGroup.append(res)        
        return wordsGroup.map { $0.joined() }
    }
    
    private func spaceString(_ count: Int) -> String {
        Array(repeating: " ", count: count).joined()
    }
    
    
}
